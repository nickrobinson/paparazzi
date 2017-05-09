FROM  ubuntu:latest

# Enable EPEL for Node.js
RUN curl -sL https://deb.nodesource.com/setup | bash -
# Install Node.js and npm
RUN apt-get update ; apt-get install -yq nodejs npm
RUN ln -s /usr/bin/nodejs /usr/bin/node

# Copy source code
ADD . /paparazzi

RUN cd /paparazzi

RUN chmod +x /paparazzi/node_modules/coffee-script/bin/coffee

# Install app dependencies
RUN cd /paparazzi; make install

EXPOSE  3000
WORKDIR /paparazzi
CMD ["node", "/paparazzi/demo/bootstrap.js"]

