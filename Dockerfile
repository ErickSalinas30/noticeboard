FROM python:3.11-slim

LABEL autor="Erick Andres Salinas" version="1.0.0" descripcion="Imagen docker centralizada para la aplicacion de anuncios"

ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1 PORT=5000 FLASK_DEBUG=0

WORKDIR /src

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

RUN useradd -u 1001 -m noticeboarduser && mkdir -p /src/instance && chown -R noticeboarduser:noticeboarduser /src

COPY --chown=noticeboarduser:noticeboarduser . ./noticeboard

USER noticeboarduser

EXPOSE 5000

CMD ["python", "-m", "noticeboard.run"]