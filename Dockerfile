FROM nikolaik/python-nodejs:python3.9-nodejs18
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
COPY app.py app.py
WORKDIR /flask-app
RUN pip3 install flask
RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir --upgrade --requirement Installer
CMD "--host=0.0.0.0"
