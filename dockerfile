# Use an official Node runtime as the base image
FROM node:16-alpine as build

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (if available) first, for caching purposes
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code into the container
COPY . .

# Build the React application
RUN npm run build

# Install a static server to serve the React app
# Here, we'll use serve as an example, but others like nginx can be used too
RUN npm install -g serve

# Command to run the application
CMD ["serve", "-s", "build", "-l", "3000"]

# Expose port 3000 for the app
EXPOSE 3000