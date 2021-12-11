# ft_server

A docker container build from debian buster.

--> He's running a web server nginx, on localhost.

--> The server is running wordpress, phpmyadmin and mysql.

build (with root): 		``docker build -t <image_name> .``

run (with root): 		``docker run --name <name> -it -p 80:80 -p 443:443 <image_name>``

run (AUTOINDEX=off):	``docker run --name <name> --env AUTOINDEX=off -it -p 80:80 -p 443:443 <image_name>``

If you want get into the image container running :

--> ``docker exec -it <mycontainer> bash``
you can find your docker running id with --> ``docker ps``
