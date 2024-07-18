FROM node:18-alpine

WORKDIR /app

# Copy the rest of the application
COPY . .

# Install dependencies
RUN npm ci

# Expose the port Next.js runs on
EXPOSE 3000

# テレメトリを無効
ENV NEXT_TELEMETRY_DISABLED 1

# Run the development server
CMD ["npm", "run", "dev"]
