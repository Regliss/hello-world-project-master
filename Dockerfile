FROM node:13.6.0-alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
#COPY package*.json ./
#ADD package.json /usr/src/app/package.json
RUN npm cache clean --force

RUN npm install

RUN npm rebuild bcrypt --build-from-source

# Bundle app source
#COPY . .

USER node
CMD [ "npm", "start" ]