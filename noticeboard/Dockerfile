FROM python: 3.11-slim

LABEL autor= "Erick Andres Salinas" \
      version="1.0.0" \
      descripcion= "Imagen docker centralizada para la aplicacion de anuncios"

ENV PYTHONDONTWRITEBYCODE=1 \
    PYTHONNUNBUFFERED=1 \
    PORT=5000 \
    FLASK_DEBUG=0

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

RUN useradd -u 1001 -m noticeboarduser && \
    mkdir -p /app/instance && \
    chown -R noticeboarduser:noticeboarduser /app

COPY --chown=noticeboarduser:noticeboarduser . .


USER noticeboarduser

EXPOSE 5000

CMD ["python", "run.py"]