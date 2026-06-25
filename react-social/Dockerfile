##Build stage
FROM node:18-alpine as build
WORKDIR /app
COPY . .
RUN npm install --legacy-peer-deps
RUN npm run build   

## Run stage
FROM nginx:alpine
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=build /app/build .
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
