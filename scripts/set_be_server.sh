#!/bin/sh

docker login \
    jjunmee-cr.kr.ncr.ntruss.com \
    -u "B51205701AA2E2A88266" \
    -p "2228D78D3E824905F2726BEC557C9395010C0A15"

docker pull ~-jjunmee-cr.kr.ncr.ntruss.com/lion-app:latest

docker run -p 8000:8000 -d \
    --name lion-app \
    -v ~/.aws:/root/.aws:ro \
    --env-file .env \
    jjunmee-cr.kr.ncr.ntruss.com/lion-app:latest