FROM docker.io/nvidia/cuda:12.2.0-devel-ubuntu22.04

# Update package list and install dependencies non-interactively
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt update && \
    apt install -y \
    git \
    wget \
    gnupg2 \
    curl \
    lsb-release \
    sudo \
    bind9-utils \
    iputils-ping

# Remove the directory if it exists
RUN rm -rf /opt/plexupdate

# Create the directory
RUN mkdir -p /opt/plexupdate

# Set the working directory to /opt/plexupdate
WORKDIR /opt/plexupdate

# Copy the scripts into the container
COPY install.sh /opt/plexupdate/install.sh

# Make the script executable
RUN chmod +x /opt/plexupdate/install.sh

# Execute the script
CMD ["sh", "-c", "/opt/plexupdate/install.sh"]
