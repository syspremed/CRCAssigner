# CRCAssigner

An R package for predicting colorectal cancer subtypes (Sadanandam, et al, 2013; Ragulan, et al 2019 and Guinney, et al. 2015) using 786 gene signature or a reduced set of 38 genes.

# INSTALLATION

require(devtools)

install_github("syspremed/CRCAssigner")

# Usage

CRCA(direc, file, PAM = PAM38, und_cutoff = 0.15, mix_cutoff = 0.06) 

# Arguments

direc The working directory with the the expression data and where the output is going to be posted.

file The file with the expression data, with genes on the rows and the first column should contain gene names.

PAM Choice of which centroid to use, 786 genes signature (PAM786) or reduced set of 38 genes (PAM38). Default is 38 gene signature.

und_cutoff Cutoff of identifying low confidence samples (und_cutoff = 0.15)

mix_cutoff Cutoff of identifying mixed samples (mix_cutoff = 0.06)

# Output

Output of this analysis will be in the current working directory. This include 

(i) subtypes_table with the frequency of each subtype, 

(ii) CRCAssigner_map with the predicted subtypes, 

(iii) correlation with the correlation of samples to each subtype, and 

(iv) CRCAssigner data with the expression of the matched genes.

# CITATIONS

Please cite the following if you use this code in your publication:

1. Sadanandam, A. Lyssiotis, C.A. Homicsko, K. Collisson, E.A. Gibb, W.J. Wullschleger, S. Ostos, L.C. Lannon, W.A. Grotzinger, C. Del Rio, M. Lhermitte, B. Olshen, A.B. Wiedenmann, B. Cantley, L.C. Gray, J.W. Hanahan, D. (2013). A colorectal cancer classification system that associates cellular phenotype and responses to therapy. Nat med, Vol.19 (5), pp. 619-625.

2.  Ragulan, C. Eason, K. Fontana, E. Nyamundanda, G. Tarazona, N. Patil, Y. Poudel, P. Lawlor, R.T. Del Rio, M. Koo, S.-. Tan, W.-. Sclafani, F. Begum, R. Teixeira Mendes, L.S. Martineau, P. Scarpa, A. Cervantes, A. Tan, I.B. Cunningham, D. Sadanandam, A. (2019). Analytical Validation of Multiplex Biomarker Assay to Stratify Colorectal Cancer into Molecular Subtypes. Scientific reports, Vol.9 (1). 

3. Guinney, J. Dienstmann, R. Wang, X. de Reyniès, A. Schlicker, A. Soneson, C. Marisa, L. Roepman, P. Nyamundanda, G. Angelino, P. Bot, B.M. Morris, J.S. Simon, I.M. Gerster, S. Fessler, E. De Sousa E Melo, F. Missiaglia, E. Ramay, H. Barras, D. Homicsko, K. Maru, D. Manyam, G.C. Broom, B. Boige, V. Perez-Villamil, B. Laderas, T. Salazar, R. Gray, J.W. Hanahan, D. Tabernero, J. Bernards, R. Friend, S.H. Laurent-Puig, P. Medema, J.P. Sadanandam, A. Wessels, L. Delorenzi, M. Kopetz, S. Vermeulen, L. Tejpar, S. (2015). The consensus molecular subtypes of colorectal cancer. Nature medicine, Vol.21 (11), pp. 1350-1356. 


