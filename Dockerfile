FROM python:3-slim-buster AS builder

WORKDIR /app/

RUN python3 -m venv venv
ENV VIRTUAL_ENV=/flask-app/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY . /app/
RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir --upgrade requirements Installer


FROM python:3-slim-buster AS runner

WORKDIR /flask-app

COPY --from=builder /flask-app/venv venv
COPY app.py app.py

ENV VIRTUAL_ENV=/flask-app/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
ENV FLASK_APP=app/app.py

EXPOSE 8080

CMD ["python", "-m" , "flask", "run", "--host=0.0.0.0"]
