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

# Install the requirements for running sqitch
RUN apt-get --yes install build-essential cpanminus postgresql perl perl-doc
RUN cpanm --quiet --notest App::Sqitch
RUN apt-get --yes install postgresql libdbd-pg-perl

EXPOSE 8080

# Copy across the working directory for the node app
ADD . /spirit

# Install the node modules
WORKDIR /spirit/spirit-api
RUN npm install

# Run initial database migrations and start pm2
ADD ./docker/api/startup.sh /root/startup.sh
ADD ./docker/api/seed.sql /root/seed.sql
RUN chmod +x /root/startup.sh
CMD /root/startup.sh