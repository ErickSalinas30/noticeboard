FROM python:3.11-slim

LABEL autor="Erick Andres Salinas" version="1.0.0" descripcion="Imagen docker centralizada para la aplicacion de anuncios"


ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python", "run.py"]