# syntax = docker/dockerfile:experimental
FROM node:20-bookworm-slim AS builder

WORKDIR /app

COPY . .
# COPY package.json package-lock.json ./
RUN npm ci

RUN npm run build

# Production stage
FROM node:20-bookworm-slim AS runner

WORKDIR /app

ENV NODE_ENV production

RUN groupadd -r --gid 1001 next && useradd -r --uid 1001 --gid 1001 next

COPY --from=builder /app/public ./public
COPY --from=builder --chown=next:next /app/.next/standalone ./
COPY --from=builder --chown=next:next /app/.next/static ./.next/static

EXPOSE 3000

USER next

# テレメトリを無効
ENV NEXT_TELEMETRY_DISABLED 1

CMD ["node", "server.js"]