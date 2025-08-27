# Etapa 1: Construcción de la app
FROM node:22 AS build

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Etapa 2: Servir con Nginx
FROM nginx:stable-alpine

COPY --from=build /app/dist /usr/share/nginx/html

# Exponer puerto 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
