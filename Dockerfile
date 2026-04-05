# 1. Use a specific version (satisfies 'no latest tag' rule)
FROM node:18-alpine

# 2. Set working directory
WORKDIR /usr/src/app

# 3. Copy package files
COPY package*.json ./

# 4. Install dependencies
RUN npm install --only=production

# 5. Copy the rest of your code
COPY . .

# 6. Create a non-root user and switch to it (CRITICAL for Quality Gate)
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# 7. Expose the port
EXPOSE 3000

# 8. Start the application
CMD ["node", "app.js"]