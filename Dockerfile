FROM nikolaik/python-nodejs:python3.9-nodejs18
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
COPY . /app/
WORKDIR /flask-app
RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir --upgrade --requirement Installer
COPY app.py app.py
EXPOSE 8080
CMD ["python", "-m" , "zthon" "flask", "run", "--host=0.0.0.0"]
