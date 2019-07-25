# BUILDER STAGE SETUP

# set base image for builing face
FROM node:alpine as builder

# set working directory
WORKDIR '/app'

# copy package.json
COPY package.json .

# install dependencies
RUN npm install

# copy application files
COPY . .

# run build command
RUN npm run build

# result is saved to /app/build



# SEVERING STAGE SETUP

#set base engine for serving the application
FROM nginx

# expose nginx port
EXPOSE 80

# copy result from the building face
COPY --from=builder /app/build /usr/share/nginx/html

# nginx starts up by default
