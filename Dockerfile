# Usar una imagen base oficial de Python
FROM python:3.9-slim

# Establecer el directorio de trabajo en /app
WORKDIR /app

# Copiar el archivo de dependencias y luego instalar las dependencias
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el resto del código de la aplicación
COPY . .

# Exponer el puerto 8080 para que Cloud Run pueda servir tráfico
EXPOSE 8080

# Comando para ejecutar la aplicación usando gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "main:app"]