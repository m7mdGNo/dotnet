set -e
ssh root@104.248.96.25 'cd /root/dotnet && git pull --recurse-submodules'
ssh root@104.248.96.25 'cd /root/dotnet && docker-compose up -d --build'
ssh root@104.248.96.25 'cp /root/dotnet/infrastructure/nginx.conf /etc/nginx/sites-enabled/dotnet.conf'
ssh root@104.248.96.25 'sudo nginx -s reload'