 FROM python:3.8-slim-buster

 WORKDIR /app

 COPY requirements.txt requirements.txt
 RUN pip3 install --no-cache-dir --upgrade --requirement Installer

 COPY . .
 
 ENV PATH="/home/zthon/bin:$PATH"

 EXPOSE 8080
 COPY app.py app.py
 
 WORKDIR /flask-app
 
 CMD ["python3", "-m", "zthon"]
