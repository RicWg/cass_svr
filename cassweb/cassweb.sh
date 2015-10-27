
#cker pull nginx:latest
#docker pull debian
#docker build -t nodejs .

docker stop nodejs
docker stop web

docker rm nodejs
docker rm web

docker run \
	-d \
	--name "nodejs" \
	-p 5000:5000 \
	nodejs;
	
docker ps

curl http://localhost:5000/api 

#docker rm web
docker run \
	-d  \
	--name "web" \
	-p 8080:80 \
	-v $(pwd)/web/src:/var/www \
	-v $(pwd)/config/nginx.conf:/etc/nginx/nginx.conf \
	--link nodejs:nodejs \
	nginx;
	
docker ps

curl http://localhost:8080

