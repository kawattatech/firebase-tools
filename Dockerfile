FROM node:alpine

RUN npm install -g grpc --allow-root --unsafe
RUN npm install -g firebase-tools

