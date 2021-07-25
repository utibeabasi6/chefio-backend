FROM node:alpine

WORKDIR /Chefio

COPY api/ .

RUN yarn install

RUN yarn build

CMD ["yarn", "start"]