CRCA <- function(direc, file, PAM='PAM38', und_cutoff = 0.15, mix_cutoff = 0.06)
{
  if(missing(direc)){stop("Provide the working directory with the data.\n")}
  if(missing(file)){stop("Expression data are required..\n ")}
  if(!is.character(PAM)){stop("PAM38 or PAM786 should be in quotes i.e., "PAM38" or "PAM786"..\n ")}
  
  #preparing the directory and folders
  setwd( direc )
  file_s <- strsplit(file, ".txt")
  
  file_s = sapply(strsplit(basename(file),"\\."), function(x) paste(x[1:(length(x))], collapse="."))
  
  outfile <- paste0( direc,"/",file_s, "_CRCassigner_map.txt", sep ="" )
  outfile_cor <- paste0( direc,"/",file_s, "_correlation.txt", sep ="" )
  outfile_tab <- paste0( direc,"/",file_s, "_subtypes_table.txt", sep ="" )
  outfile_file <- paste0( direc,"/",file_s, "_CRCAssigner_data.txt", sep ="" )
  
  # reading data
  data <- read.delim(file, stringsAsFactors = FALSE)
  
  # making a matrix
  data_m <- data.matrix(data[,2:ncol(data)])
  row.names(data_m) <- data[,1]
  
  # median centering data
  med <- apply(data_m, 1, median)
  data_m_med <- data_m - med
  
  # reading PAM centroids
  if(PAM=='PAM38'){
    data('PAM38', package = 'CRCAssigner')
    crc <- PAM38
  }
  if(PAM=='PAM786'){
    data('PAM786', package = 'CRCAssigner')
    crc <- PAM786
  }
  
  # making a matrix
  crc_m <- data.matrix(crc)
  row.names(crc_m) <- rownames(crc)
  
  # matching genes between data and PAM centroids
  m <- match(rownames(crc_m), rownames(data_m))
  w <- which(!is.na(m))
  
  # performing correlation
  corr <- cor(data_m_med[m[w],], crc_m[w,])
  
  # finding which subtype has maximum correlation
  corr_max_w <- apply(corr, 1, function(x) which.max(x))
  
  # Low confidence subtypes
  corr_low_conf <-apply(corr, 1, function(x) which(x[which.max(x)] < und_cutoff))
  n_corr_low_conf <- which(corr_low_conf == TRUE)
  names_corr_low_conf <- colnames(corr)[corr_max_w]
  names_corr_low_conf[n_corr_low_conf] <- "Undetermined"
  
  # Mixed subtypes
  corr_mixed <-apply(corr, 1, function(x) which((x[which.max(x)] -  x[which(x == sort(x,partial=length(x)-1)[length(x)-1])]) < mix_cutoff))
  n_mixed <- which(corr_mixed == TRUE)
  names_mixed <- colnames(corr)[corr_max_w]
  names_mixed[n_mixed] <- "mixed"
  
  # making a matrix of subtype identity for samples with PAM centroids
  sub <- cbind(rownames(corr), corr, colnames(corr)[corr_max_w], names_corr_low_conf, names_mixed) 
  colnames(sub)[1] <- "Samples"
  colnames(sub)[7] <- "Subtype"
  colnames(sub)[8] <- "Undetermined subtypes"
  colnames(sub)[9] <- "Mixed subtypes"
  
  # calculating table of subtypes for statistics
  sub_table <- table(colnames(corr)[corr_max_w])
  
  #writing data
  write.table(sub, outfile, row.names = FALSE, sep = "\t", quote = FALSE)
  
  #writing subtype table
  write.table(sub_table, outfile_tab, row.names = FALSE, sep = "\t", quote = FALSE)
  
  #writing CRCAssigner-786 data
  write.table(data_m_med[m[w],], outfile_file, sep = "\t", quote = FALSE)
  
  #writing correlation
  write.table(corr, outfile_cor, sep = "\t", quote = FALSE)
  
  return( sub_table )
  
}
