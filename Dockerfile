FROM python:3.10-slim-buster

RUN apt update -y && apt install awscli -y
WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt
RUN pip unstall --upgrade accelerate
RUN pip uninstall -y transformers accelerate
RUN pip install transformers accelerate

cmd ["python3", "app.py"]