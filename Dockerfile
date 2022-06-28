FROM node:14-alpine AS builder
WORKDIR /code
COPY ./ ./
RUN npm install; npm run build;

FROM node:14-alpine as services
EXPOSE 3000/tcp
WORKDIR /app/
COPY ./package.json ./
COPY --from=builder /code/dist/ ./
RUN npm install
CMD ["node", "index.js" ]