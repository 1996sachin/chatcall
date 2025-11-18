# Use official Node.js image
FROM node:20-alpine

# Set working directory inside container
WORKDIR /app

# Copy package files first (better cache)
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy project source code
COPY . .

# Expose application port
EXPOSE 9005

# Start the server
CMD ["npm", "start"]