FROM node:16-alpine AS builder
WORKDIR "/app"
COPY package.json .
RUN npm install
COPY . .
CMD [ "npm", "run", "build" ]

FROM nginx
EXPOSE 80
COPY --from=builder /app/dist /usr/share/nginx/html