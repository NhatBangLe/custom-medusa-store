# Set working directory
FROM node:22-alpine AS builder

WORKDIR /app

# Copy package files and yarn config
COPY . .

# Install all dependencies using yarn
RUN yarn install

RUN yarn run build

FROM node:22-alpine AS runner

WORKDIR /app

COPY --from=builder /app/.medusa .

WORKDIR /app/server

# Install all dependencies using yarn
RUN yarn install

ENV NODE_ENV=production

# Expose the port Medusa runs on
EXPOSE 9000

CMD [ "yarn", "run", "start" ]
