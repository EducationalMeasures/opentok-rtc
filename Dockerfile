FROM node:8
WORKDIR /usr/src/app
COPY package*.json ./
COPY .bowerrc ./
RUN npm i -g grunt-cli
RUN npm install
RUN wget http://download.redis.io/redis-stable.tar.gz
RUN tar xvzf redis-stable.tar.gz
WORKDIR /usr/src/app/redis-stable
RUN make
RUN cp src/redis-server /usr/local/bin/
RUN cp src/redis-cli /usr/local/bin/
EXPOSE 8123
WORKDIR /usr/src/app
CMD ["npm", "run", "dev"]