# Install_R_Ubuntu26

Download the bash script and run it:

bash install_R.sh 

You will have to provide your sudo credentilas when prompted

The scripts executes the following steps:
1. Add the official CRAN repository for Ubuntu 26.04.
2. Install the CRAN signing key.
3. Install R and development tools.
4. Install common system libraries required for compiling R packages.
5. Verify the R installation

To obtain Rstudio latest release visit:

https://docs.posit.co/ide/user/download.html

Download *.deb file recommended for your software distribution

Navigate to it and type:

sudo apt install ./rstudio-2026.10.1-239-amd64.deb

Find the icon of Rstudio in the installed Apps and open it

File-> New File -> Rscript

install.packages(c(
  "xml2",
  "curl",
  "jsonlite",
  "stringi",
  "data.table"
))

These packages provide a useful initial test of your compilation environment


