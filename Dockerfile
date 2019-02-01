# base image
FROM node:alpine as builder
WORKDIR /app
# install dep
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build

# deploy nginx
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html



