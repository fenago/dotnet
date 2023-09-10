FROM gitpod/workspace-full
# Use the dotnet --list-sdks and dotnet --list-runtimes commands to see which versions are installed.
# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Add the Microsoft package signing key to your list of trusted keys and add the package repository
RUN wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    sudo dpkg -i packages-microsoft-prod.deb && \
    sudo apt-get update && \
    sudo apt-get install -y dotnet-sdk-7.0 && \
    sudo apt-get install -y aspnetcore-runtime-7.0 && \
    sudo apt-get install -y dotnet-runtime-7.0 && \
    rm packages-microsoft-prod.deb

# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=dialog
