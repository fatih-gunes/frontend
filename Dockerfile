FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html


# $ docker build .
# $ docker run -p 8080:80 <image-id>


# In AWS, instead of this:

# FROM node:alpine as builder
# WORKDIR '/app'
# COPY package.json .
# RUN npm install
# COPY . .
# RUN npm run build
 
# FROM nginx
# COPY --from=builder /app/build /usr/share/nginx/html
# Do this:

# FROM node:alpine
# WORKDIR '/app'
# COPY package.json .
# RUN npm install
# COPY . .
# RUN npm run build
 
# FROM nginx
# COPY --from=0 /app/build /usr/share/nginx/html