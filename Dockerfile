# 1. Use the official Playwright image
FROM mcr.microsoft.com/playwright:v1.64.1-noble

# 2. Set the working directory
WORKDIR /app

# 3. Copy dependency manifests
COPY package.json package-lock.json ./

# 4. Install project dependencies
RUN npm ci

# 5. Copy the rest of the project
COPY . .

# 6. Default command to run Playwright tests
CMD ["npx", "playwright", "test"]