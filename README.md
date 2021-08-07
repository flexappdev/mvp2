# MVP1
MVP1: 

0. Setup github
1. Dockerize Django Application
2. Deploying to EC2

## CHEAT
```
# start
clear && cd ~/mvp1 && source venv/bin/activate && cd app 

&& python manage.py runserver 9000

# end
cd ~/mvp1 && deactivate && git add * && git commit -m "update" && git push -u origin main


 && cd ..

# force push
deactivate && cd .. && 
git add * && git commit -m "update" && git push --force origin main

python manage.py makemigrations
python manage.py migrate
python manage.py runserver
```



# 0. Setup github
- create dir (mkdir 'mvp1')
- create github project
- create readme + push
- add .gitignore

## create dir
```
mkdir mvp1
cd mvp1
```
## create readme + push
- create readme: README.md
- 
```
git remote add origin https://github.com/flexappdev/mvp1.git
git branch -M main
git push -u origin main
```
## create readme + push
```
clear && git add * && git commit -m "mvp1 update" && git push origin main
```

# 1. Dockerize Django Application
- create 'app' dir
- create venv
- install django
- create django project
- run migration
- start development server
- allow traffic to all sources
- add a Dockerfile
- save the dependencies installed
- build the docker image
- run docker image
- log in to Dockerhub 
- tag image with our username
- push it to Dockerhub

## create venv
```
python3 -m venv venv
source venv/bin/activate
```
## create django project
```
pip install Django
django-admin startproject app
cd app
python manage.py migrate
python manage.py runserver 9000
```

## allow traffic to all sources:
- app > app > settings > ALLOWED_HOSTS = ['*']
```
import os
'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
```

## add a Dockerfile
```
FROM python:3
EXPOSE 9000
ADD . /app
WORKDIR /app
RUN pip install -r requirements.txt
RUN python app/manage.py makemigrations
RUN python app/manage.py migrate
CMD [ "python", "app/manage.py", "runserver", "0.0.0.0:9000" ]
```
## save the dependencies installed
pip freeze > requirements.txt

## build the docker image
```
cd ~/mvp1
docker build . -t mvp1
docker run -d -p 9000:9000 mvp1
http://localhost:8000/
```

- run docker image
- log in to Dockerhub 
- tag image with our username
- push it to Dockerhub

## Dockerhub
- log in to Dockerhub 
- tag image with our username
- push it to Dockerhub
```
docker login
docker tag mvp1 flexappdev/mvp1
docker push flexappdev/mvp1
```


Accessing the EC2 Instance
- ssh to instance
- Update packages (sudo yum update -y)
- Install Docker Engine package
- Start the Docker service
- Add the ec2-user to the docker group
- log out (exit)
- shh

```
cd ~/aws
chmod 400 django_apps.pem
ssh -i "django_apps.pem" ec2-user@ec2-18-130-204-170.eu-west-2.compute.amazonaws.com


cd ~/aws && chmod 400 django_apps.pem && ssh -i "django_apps.pem" ec2-user@ec2-18-130-204-170.eu-west-2.compute.amazonaws.com

docker run -d -p 8000:8000 flexappdev/django_ec2
http://localhost:8000/

