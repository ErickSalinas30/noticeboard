FROM python:3.11-slim

LABEL autor="Erick Andres Salinas" version="1.0" descripcion="Imagen docker centralizada para la aplicacion de anuncios"

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PORT=5000 \
    FLASK_DEBUG=0

RUN useradd -u 1001 -m noticeboarduser

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY --chown=noticeboarduser:noticeboarduser . .

RUN mkdir -p /app/instance && chown -R noticeboarduser:noticeboarduser /app

USER noticeboarduser

EXPOSE 5000

CMD ["python", "run.py"]