
#!/usr/bin/env bash

set -e

echo "======================================"
echo " Installing R on Ubuntu "
echo "======================================"

# Display Ubuntu version
. /etc/os-release

echo "Detected operating system: $PRETTY_NAME"

# Check architecture
echo "Checking system architecture..."

ARCH=$(dpkg --print-architecture)

echo "Detected system architecture: $ARCH"

if [[ "$ARCH" != "amd64" && "$ARCH" != "arm64" ]]; then
    echo "Unsupported architecture: $ARCH"
    exit 1
fi

echo "Architecture is supported."

# Update package lists
echo "Updating Ubuntu packages..."
sudo apt update

# Install tools needed to configure CRAN repository
echo "Installing repository management tools..."
sudo apt install -y --no-install-recommends \
    ca-certificates \
    wget \
    gnupg \
    software-properties-common

# Add official CRAN signing key
echo "Adding CRAN signing key..."

sudo install -d -m 0755 /etc/apt/keyrings

wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc \
    | sudo gpg --dearmor --yes \
    -o /etc/apt/keyrings/cran-ubuntu-keyring.gpg

sudo chmod 644 /etc/apt/keyrings/cran-ubuntu-keyring.gpg

# Add official CRAN repository
echo "Adding CRAN repository..."

echo "deb [arch=${ARCH} signed-by=/etc/apt/keyrings/cran-ubuntu-keyring.gpg] https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/" \
    | sudo tee /etc/apt/sources.list.d/cran-r.list > /dev/null

# Update package lists
sudo apt update

# Install R and compilation dependencies
echo "Installing R and development dependencies..."

sudo apt install -y \
    r-base \
    r-base-dev \
    build-essential \
    gfortran \
    cmake \
    pkg-config \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff-dev \
    libjpeg-dev \
    zlib1g-dev \
    libicu-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libuv1-dev \
    libgsl-dev

# Verify installation
echo "======================================"
echo " Installation completed!"
echo "======================================"

R --version

echo ""
echo "Checking compiler availability..."

gcc --version | head -n 1
g++ --version | head -n 1
gfortran --version | head -n 1

echo ""
echo "R installation is ready."
echo "You can start R by typing: R"

