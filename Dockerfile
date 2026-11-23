#
#FROM node:20-alpine
#
#WORKDIR /app
#
#COPY package*.json ./
#
#RUN npm install
#
#COPY . .
#
#EXPOSE 3000
#
#CMD ["npm", "start"]

# Optimized version
#FROM node:20-alpine AS build
#
#WORKDIR /app
#COPY package*.json ./
#RUN npm ci --only=production
#
## Runtime stage
#FROM node:20-alpine
#
#WORKDIR /app
#RUN addgroup -g 1001 nodejs && \
#    adduser -S nodejs -u 1001
#
## Copy van build stage
#COPY --from=build --chown=nodejs:nodejs /app/node_modules ./node_modules
#COPY --chown=nodejs:nodejs src ./src
#
#USER nodejs
#
#EXPOSE 3000
#CMD ["node", "src/index.js"]

FROM node:20-alpine

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY src ./src

EXPOSE 3000

CMD ["npm", "start"]