 FROM python:3.9-slim-buster
 WORKDIR /app/
 COPY . /app/
 RUN pip3 install --upgrade pip
 RUN pip3 install --no-cache-dir --upgrade --requirement Installer
 EXPOSE 8080
 COPY app.py app.py
 WORKDIR /flask-app
 CMD ["python3", "-m", "zthon"]
