FROM 315700761720.dkr.ecr.ap-northeast-1.amazonaws.com/adip/master-data-manager-base:latest

RUN mkdir /usr/src/app
RUN mkdir /usr/src/app/static
WORKDIR /usr/src/app
COPY . /usr/src/app

COPY ./entrypoint.sh /
COPY requirements.txt .

RUN pip install -r requirements.txt
RUN chmod o+x /entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["/entrypoint.sh"]
