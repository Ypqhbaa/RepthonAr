# Python Based Docker
FROM python:latest

# Installing Packages
RUN apt update && apt upgrade -y
RUN apt install git curl python3-pip ffmpeg -y

# Updating Pip Packages
RUN pip3 install -U pip

# Copying Requirements
COPY requirements.txt /Installer

# Installing Requirements
RUN cd /
RUN pip3 install -U -r Installer
WORKDIR /root

# Running MessageSearchBot
CMD ["python3 -m zthon"]
