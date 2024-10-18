FROM node:18-alpine AS builder

COPY ./ /src
WORKDIR /src
RUN npm config set proxy http://192.168.11.18:8118 && npm config set https-proxy http://192.168.11.18:8118 && npm install && npm run build


FROM  webhttp
COPY --from=builder /src/public /usr/local/openresty/nginx/html