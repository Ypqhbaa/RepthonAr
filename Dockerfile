FROM python:3-slim-buster AS builder

WORKDIR /flask-app

RUN python3 -m venv venv
ENV VIRTUAL_ENV=/flask-app/venv
RUN pip3 install flask
RUN git clone https://github.com/RepthonArabic/RepthonAr/tree/koyeb
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN pip3 install -r requirements.txt
COPY requirements.txt requirements.txt

FROM python:3-slim-buster AS runner

WORKDIR /flask-app

COPY --from=builder /flask-app/venv venv
COPY app.py app.py

ENV VIRTUAL_ENV=/flask-app/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
ENV FLASK_APP=app/app.py

EXPOSE 8080

CMD ["python", "-m" , "zthon" "flask", "run", "--host=0.0.0.0"]
