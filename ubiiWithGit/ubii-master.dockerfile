FROM node:14-bullseye

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apt-get update -qq && \
apt-get install -y -qq libzmq5-dev git

# Install app dependencies
RUN git clone https://github.com/SandroWeber/ubii-node-master.git
WORKDIR /usr/src/app/ubii-node-master
RUN npm install

RUN cp config.json.template config.json

EXPOSE 8101 8102 8103 8104
CMD ["npm", "start"]
