FROM node:24-alpine

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .

# ✅ Create non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# ✅ Switch user
USER appuser

EXPOSE 5000
CMD ["node", "index.js"]