# Usa una imagen base de Node.js para construir la app
FROM node:14 AS build

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos package.json y package-lock.json
COPY package*.json ./

# Instala las dependencias
RUN npm install

# Copia el resto de los archivos de la app
COPY . .

# Compila la app Angular
RUN npm run build --prod

# Usa una imagen base de Nginx para servir la app
FROM nginx:alpine

# Copia los archivos compilados de Angular a Nginx
COPY --from=build /app/dist/cloudrun /usr/share/nginx/html

# Configura Nginx para escuchar en el puerto 8080
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d

# Expone el puerto 8080
EXPOSE 8080

# Comando para correr Nginx
CMD ["nginx", "-g", "daemon off;"]
