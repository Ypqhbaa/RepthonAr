FROM python:latest
RUN apt update && apt upgrade -y
RUN apt install git curl python3-pip ffmpeg -y
RUN pip3 install -U pip
COPY . /app/
WORKDIR /app/
RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir --upgrade requirement Installer
CMD ["/bin/bash", "start.sh"]
