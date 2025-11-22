# Build stage
FROM node:22-alpine AS build

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install git (required for some npm packages)
RUN apk add --no-cache git

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Nuxt application
RUN npm run build

# Production stage
FROM node:22-alpine AS production

# Set working directory
WORKDIR /app

# Copy built application from build stage
COPY --from=build /app/.output ./.output

# Copy package.json for any runtime dependencies if needed
COPY --from=build /app/package*.json ./

# Install only production dependencies if any are needed for runtime
RUN npm install --production && npm cache clean --force

# Expose the port the app runs on
EXPOSE 3000

# Command to run the application
CMD ["node", ".output/server/index.mjs"]