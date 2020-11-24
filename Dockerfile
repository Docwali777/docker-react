FROM node:alpine
WORKDIR "/app"
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=0 /app/build  /usr/share/nginx/html



# docker-compose.ymal

# version: "3"
# services: 
#   web: 
#     stdin_open: true
#     environment:
#       - CHOKIDAR_USEPOLLING=true
#     build: 
#       context: .
#       dockerfile: Dockerfile.dev
#     ports: 
#       - "3000:3000"
#     volumes: 
#       - /app/node_modules
#       - .:/app
#   tests:
#     stdin_open: true
#     build:
#       context: .
#       dockerfile: Dockerfile.dev
#     volumes: 
#       - /app/node_modules
#       - .:/app
#     command: ["npm", "run", "test"]