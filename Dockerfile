
FROM node:16-alpine as backend

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["node", "server.js"]

FROM nginx:alpine as frontend

COPY ./public /usr/share/nginx/html

EXPOSE 80
