FROM node:14

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apt-get update -qq && \
apt-get install -y -qq git

# Install app dependencies
RUN git clone https://github.com/SandroWeber/ubii-web-frontend.git
WORKDIR /usr/src/app/ubii-web-frontend
RUN npm install

EXPOSE 8080
CMD npm run serve
