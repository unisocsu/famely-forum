FROM node:22-bookworm-slim
WORKDIR /usr/src/app
ENV NODE_ENV=production
RUN apt-get update && apt-get install -y --no-install-recommends git python3 build-essential ca-certificates && rm -rf /var/lib/apt/lists/*
RUN git clone --depth 1 --branch master https://github.com/NodeBB/NodeBB.git /usr/src/app
RUN npm install --omit=dev
EXPOSE 4567
CMD ["node","loader.js"]
