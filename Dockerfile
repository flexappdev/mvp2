FROM python:3

EXPOSE 9000
ADD . /app
WORKDIR /app

RUN pip install -r requirements.txt
RUN python app/manage.py makemigrations
RUN python app/manage.py migrate

CMD [ "python", "app/manage.py", "runserver", "0.0.0.0:9000" ]