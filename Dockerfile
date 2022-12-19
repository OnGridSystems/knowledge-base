FROM node:14.17.5-buster as build-app

WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH
COPY package.json next.config.js next-env.d.ts tsconfig.json ./


COPY components ./components
COPY content ./content
COPY lib ./lib
COPY pages ./pages
COPY scripts ./scripts
COPY public ./public
COPY styles ./styles

ENV NEXT_TELEMETRY_DISABLED 1

RUN npm install
RUN npm run-script build


CMD ["bash", "-c", "npm run-script start -- -p $PORT"]
