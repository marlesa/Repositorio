ARG PYTHON_VERSION=3.11.1

FROM python:3.11.1-slim
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
EXPOSE 5000
CMD ["flask", "--app", "microservicios", "--debug", "run", "--host=0.0.0.0"]