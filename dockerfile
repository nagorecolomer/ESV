# Usa una imagen base de Python
FROM python:3.9-slim

# Actualiza el sistema e instala las dependencias necesarias
RUN apt-get update && apt-get install -y ffmpeg python3-tk && apt-get clean

# Configura el directorio de trabajo
WORKDIR /app

# Crea directorios para inputs y outputs
RUN mkdir -p /app/inputs /app/outputs

# Copia los archivos necesarios para la GUI y la API
COPY main.py /app/
COPY gui.py /app/  
# Instala las dependencias de la GUI y la API
RUN pip install fastapi[standard] uvicorn numpy opencv-python-headless scipy pywavelets pillow requests

# Exponemos el puerto 8000 para la API
EXPOSE 8000

# Comando para iniciar directamente la GUI
CMD ["python", "gui.py"]
