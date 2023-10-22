# Python Based Docker
FROM python:latest

# Installing Packages
RUN apt update && apt upgrade -y
RUN apt install git curl python3-pip ffmpeg -y

# Updating Pip Packages
RUN pip3 install -U pip

# Copying Requirements
COPY . /app/

# Installing Requirements
RUN pip3 install --upgrade
RUN pip3 install --no-cache-dir --upgrade requirements Installer
RUN pip3 install flask
WORKDIR /MissPerfectURL

# Running MessageSearchBot
CMD ["/bin/bash", "start.sh"]
