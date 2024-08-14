# Utiliza una imagen base de Node.js con la versión adecuada
FROM node:18-alpine

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /usr/src/app

# Copia el package.json y lockfile.json y ejecuta npm install
COPY package*.json ./
RUN npm install

# Copia el resto de los archivos de la aplicación.
COPY . .

# Exponer el puerto donde se ejecutará la aplicación

RUN npm run build

EXPOSE 8080

# Comando para iniciar la aplicación (ajusta según tu configuración)
CMD ["node", "server.js"]
