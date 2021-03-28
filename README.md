# ft_server

A docker container build from debian buster.

--> He's running a web server nginx, on localhost.

--> The server is running wordpress, phpmyadmin and mysql.

build (with root): ``docker build -t <image_name> .``

run (with root): ``run --name <name> -it -p 80:80 -p 443:443 <image_name>``
