FROM node:24-alpine

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

# ✅ Copy only needed files
COPY index.js .
COPY routes/ ./routes/
COPY controllers/ ./controllers/

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

EXPOSE 5000
CMD ["node", "index.js"]