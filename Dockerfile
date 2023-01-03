FROM cloudron/base:4.0.0@sha256:31b195ed0662bdb06a6e8a5ddbedb6f191ce92e8bee04c03fb02dd4e9d0286df

ADD /src/ .

WORKDIR /src

# install packages
RUN npm install -g yarn

RUN npm install -g pm2

RUN yarn install

RUN cp configs.json.sample configs.json

CMD [ "./bin/erxes.js dev" ]

