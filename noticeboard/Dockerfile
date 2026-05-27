FROM python:3.11-slim

LABEL autor="Erick Andres Salinas" version="1.0" descripcion="Imagen docker centralizada para la aplicacion de anuncios"

# Configuración del entorno de Python
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PORT=5000 \
    FLASK_DEBUG=0

# 1. Crear el usuario del sistema con UID 1001
RUN useradd -u 1001 -m noticeboarduser

# 2. Definir el directorio de trabajo
WORKDIR /app

# 3. Copiar primero el archivo de dependencias
COPY requirements.txt .

# 4. Instalar las dependencias directamente en el sistema de la imagen
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copiar todo el código del proyecto asignando los permisos al usuario seguro
COPY --chown=noticeboarduser:noticeboarduser . .

# 6. Crear la carpeta para la base de datos SQLite y asegurar sus permisos
RUN mkdir -p /app/instance && chown -R noticeboarduser:noticeboarduser /app

# 7. Cambiar al contexto del usuario seguro (A partir de aquí nada corre como root)
USER noticeboarduser

# Puerto expuesto
EXPOSE 5000

# Comando de arranque nativo
CMD ["python", "run.py"]