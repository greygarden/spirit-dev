FROM ubuntu:latest

# Install wget for downloading node binaries
RUN apt-get update
RUN apt-get --yes install curl
# Download the nodejs binary
RUN curl https://nodejs.org/dist/v6.6.0/node-v6.6.0-linux-x64.tar.gz > ~/nodejs.tar.gz
# Change to the correct directory
WORKDIR /root
# Unpack it
RUN tar -xzvf ~/nodejs.tar.gz
# Install the binaries, libraries, shared files and man docs
RUN cp -r ~/node-v6.6.0-linux-x64/bin/* /usr/local/bin/
RUN cp -r ~/node-v6.6.0-linux-x64/include/* /usr/local/include/
RUN cp -r ~/node-v6.6.0-linux-x64/lib/* /usr/local/lib/
RUN cp -r ~/node-v6.6.0-linux-x64/share/man/* /usr/local/share/man/
RUN cp -r ~/node-v6.6.0-linux-x64/share/* /usr/local/share/

ADD . /spirit

WORKDIR /spirit/spirit-frontend/asset-server
RUN npm install

WORKDIR /spirit/spirit-frontend
RUN npm install

# Start node
CMD node ./asset-server/server.js