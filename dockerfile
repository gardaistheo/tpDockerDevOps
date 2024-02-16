FROM node:12-alpine3.9

WORKDIR /app

COPY package*.json ./
RUN npm install --only=production

COPY . .

CMD ["node", "src/index.js"]
