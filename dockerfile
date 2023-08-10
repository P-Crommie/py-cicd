FROM python:3.9-slim

LABEL org.opencontainers.image.source = "https://github.com/benc-uk/python-demoapp"

WORKDIR /usr/src/app

COPY src/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY src/run.py .
COPY src/app ./app

EXPOSE 8080

CMD ["gunicorn", "-b", "0.0.0.0:8080", "run:app"]