# MVP1
MVP1: 

0. Setup github
1. Dockerize Django Application


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
git add * && git commit -m "mvp1 update" && git push origin main
```

# 1. Dockerize Django Application
- create venv
- install django
- create django project
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
pip install Django
django-admin startproject django_ec2_project
cd django_ec2_project
python manage.py runserver

settings:
ALLOWED_HOSTS = ['*']
import os
'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),

pip freeze > requirements.txt
docker build . -t django_ec2
docker run -d -p 8000:8000 django_ec2
http://localhost:8000/

docker login
docker tag django_ec2 flexappdev/django_ec2
docker push flexappdev/django_ec2

```