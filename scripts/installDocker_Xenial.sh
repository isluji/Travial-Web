
# Update package information, ensure that APT works with the https method, and that CA certificates are installed.
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates

# Add the new GPG key to the adv keychein. (For more info, see the output of man apt-key.)
sudo apt-key adv \
               --keyserver hkp://ha.pool.sks-keyservers.net:80 \
               --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# This determines where APT will search for Docker packages.
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list

# Update the APT package index.
sudo apt-get update

# Install the prerequisite packages for Ubuntu 16.04 Xenial
sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual

# Install Docker.
sudo apt-get install docker-engine

# Start the docker daemon.
sudo service docker start

# Verify that docker is installed correctly by running the hello-world image.
#   (This command downloads a test image and runs it in a container.
#   When the container runs, it prints an informational message and exits.)
sudo docker run hello-world
