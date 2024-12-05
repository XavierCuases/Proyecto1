
FROM node:16-alpine as backend

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["node", "server.js"]

FROM nginx:alpine as frontend

COPY ./public /usr/share/nginx/html
COPY public /usr/share/nginx/html/public

EXPOSE 80


FROM node:16-alpine

WORKDIR /app


COPY --from=backend /app /app


COPY --from=frontend /usr/share/nginx/html /usr/share/nginx/html

EXPOSE 3000
EXPOSE 80

CMD ["sh", "-c", "node server.js & nginx -g 'daemon off;'"]
