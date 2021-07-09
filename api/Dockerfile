FROM node:alpine
WORKDIR /app
COPY . .
RUN yarn install
RUN yarn build
# RUN yarn keystone-next prisma migrate deploy
CMD ["yarn", "start"]
# CMD ["yarn", "dev"]