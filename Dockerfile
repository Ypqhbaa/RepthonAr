FROM nikolaik/python-nodejs:python3.9-nodejs18
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
COPY . /app/
WORKDIR /app/
RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir --upgrade --requirement Installer
RUN pip3 install flask
COPY app.py app.py
WORKDIR /flask-app
RUN pip3 install flask
EXPOSE 8080
CMD ["bash","start.sh"]
