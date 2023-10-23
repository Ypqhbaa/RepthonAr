 FROM python:3.9-slim-buster

 WORKDIR /app/

 RUN pip3 install --upgrade pip
 RUN pip3 install --no-cache-dir --upgrade --requirement Installer

 COPY . /app/
 
 ENV PATH="/home/zthon/bin:$PATH"

 EXPOSE 8080
 COPY app.py app.py
 
 WORKDIR /flask-app
 
 CMD ["python3", "-m", "zthon"]
