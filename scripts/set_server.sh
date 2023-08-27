#!/bin/bash

# 현재 서버의 IP주소를 입력받아, nginx설정에 넣기
# getopts

SERVER_IP=

MANUAL="Usage: $0 [-i server_ip]"

# -i 인자로 server_ip가 들어오면, 해당 ip사용.
# 그렇지 않으면, curl ifconfig.me 이용해서 ip 자동입력

while getopts "i:" option; do
    case $option in
        i)
            SERVER_IP=$OPTARG
            ;;
        *)
            echo $MANUAL
            exit 1
            ;;
    esac
done

if [ -z $SERVER_IP ]; then
    SERVER_IP=$(curl ifconfig.me)
fi

# nginx 설치
echo "install nginx"
sudo apt install -y nginx
# nginx 설정 파일 생성
echo "create nginx config"
sudo sh -c "cat > /etc/nginx/sites-available/django <<EOF
server {
	listen 80;
	server_name $SERVER_IP;

	location / {
		proxy_pass http://127.0.0.1:8000;
		proxy_set_header Host \\\$host;
		proxy_set_header X-Real-IP \\\$remote_addr;
	}
}
EOF"
# symlink 생성
echo "create symlink"

TARGET_CONF=/etc/nginx/sites-enabled/django

if [ -e $TARGET_CONF ]; then
    echo "remove symlink"
    sudo rm $TARGET_CONF
fi

sudo ln -s /etc/nginx/sites-available/django $TARGET_CONF
# nginx 재시작
echo "restart nginx"
sudo systemctl restart nginx