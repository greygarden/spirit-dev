#!/bin/bash
# Run the initial sqitch migrations
sleep 10 &&
cd ./sqitch &&
/usr/local/bin/sqitch deploy db:pg://spirit_api:spirit_api@postgres:5432/spirit_api &&
PGPASSWORD=spirit_api psql -h postgres -U spirit_api --file=/root/seed.sql &&
cd /spirit/spirit-api &&
# Run node with PM2
./node_modules/.bin/pm2 start /spirit/docker/api/pm2.config.json --no-daemon