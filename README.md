# Install R on Ubuntu 26.04

## 1. Install R

Download the installation script and execute it from your terminal:

```bash
bash install_R.sh
```

Enter your `sudo` password when prompted.

The script automatically performs the following steps:

1. Adds the official CRAN repository for Ubuntu 26.04.
2. Installs the CRAN signing key.
3. Installs R and the required development tools.
4. Installs common system libraries required for compiling R packages.
5. Verifies the R installation.

## 2. Install RStudio

To download the latest version of RStudio, visit the official download page:

https://docs.posit.co/ide/user/download.html

Download the `.deb` package recommended for your Linux distribution.

Navigate to the directory containing the downloaded file and install it:

```bash
sudo apt install ./rstudio-2026.10.1-239-amd64.deb
```

**Note:** Replace the filename with the actual name of the downloaded package if it differs.

Once the installation is complete, launch RStudio from your installed applications.

## 3. Test the R installation

In RStudio, navigate to:

```text
File → New File → R Script
```

In the newly created R script, execute the following commands to install some commonly used R packages:

```r
install.packages(c(
  "xml2",
  "curl",
  "jsonlite",
  "stringi",
  "data.table"
))
```

These packages provide a useful initial test of your R installation and compilation environment.

If all packages install successfully, your R development environment is ready to use!

