\name{CRCA}
\alias{CRCA}
\title{
 CRCAssigner subtype classification for colorectal cancer
}
\description{
For predicting colorectal cancer subtypes (Sadanandam at al, 2013) using 786 gene signature or a reduced set of 38 genes.
}
\usage{
CRCA(direc, file, PAM = "PAM38", und_cutoff = 0.15, mix_cutoff = 0.06)
}
\arguments{
  \item{direc}{
 The working directory with the the expression data and where the output is going to be posted. 
}
  \item{file}{
 The file with the expression data, with genes on the rows and the first column should contain gene names. 
}
  \item{PAM}{
  Choice of which centroid to use, 786 genes signature ("PAM786") or reduced set of 38 genes ("PAM38"). Default is 38 gene signature. 
}
  \item{und_cutoff}{
 Cutoff of identifying low confidence samples (und_cutoff = 0.15)
}
  \item{mix_cutoff}{
 Cutoff of identifying mixed samples (mix_cutoff = 0.06)
}
}
\details{
A function predicting colorectal cancer subtypes (Sadanandam at al, 2013) using 786 gene signature or a reduced set of 38 genes.
}
\value{
Output of this analysis is in the current working directory. This include (i) subtypes_table with the frequency of each subtype, (ii) CRCAssigner_map 
with the predicted subtypes, (iii) correlation with the correlation of samples to each subtype, and (iv) CRCAssigner data with the expression of the 
matched genes.
}
\examples{
  library(CRCAssigner)
  #CRCA(direc, file, PAM, und_cutoff = 0.15, mix_cutoff = 0.06)
}
