# Build Phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run Phase
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
# default command for NGINX container is to start up NGINX server