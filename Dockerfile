ARG NODE_VERSION=20.3.0
FROM node:${NODE_VERSION} as base

# Create and set permissions for the /app directory
RUN mkdir -p /app/node_modules && chown -R root:root /app
WORKDIR /app

# Install global dependencies
RUN npm install --global pm2 ts-node typescript

# Copy package files and install dependencies
COPY --chown=root:root package*.json ./
USER root
RUN npm install

# Copy the rest of the application files
COPY --chown=root:root . .

# Ensure the setup_kafka_data.sh script has execution permissions
RUN chmod +x /app/setup_kafka_data.sh

# Run the setup_kafka_data.sh script
RUN /app/setup_kafka_data.sh

EXPOSE 1000
CMD ["npm", "run", "start"]