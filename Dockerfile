FROM cloudron/base:4.0.0@sha256:31b195ed0662bdb06a6e8a5ddbedb6f191ce92e8bee04c03fb02dd4e9d0286df

RUN mkdir -p /src
ADD /src/ /src
WORKDIR /src

ADD start.sh .

RUN useradd ds

RUN apt update && apt-get install -y rabbitmq-server ttf-mscorefonts-installer

# install packages
RUN npm install -g yarn pm2

RUN yarn install

RUN cp configs.json.sample configs.json

# add supervisor configs
ADD supervisor/* /etc/supervisor/conf.d/
RUN ln -sf /run/supervisord.log /var/log/supervisor/supervisord.log

CMD [ "start.sh" ]
