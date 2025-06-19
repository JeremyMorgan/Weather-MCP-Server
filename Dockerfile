FROM node:20-slim

# Create app directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm ci --only=production

# Copy application code
COPY server.js ./

# Set executable permissions for the server script
RUN chmod +x server.js

# Expose port if needed for health checks (MCP uses stdin/stdout for communication)
EXPOSE 8080

# Command to run the server
CMD ["node", "server.js"]
