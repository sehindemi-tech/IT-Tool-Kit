FROM node:18-alpine AS build-stage

WORKDIR /app

RUN corepack enable && corepack prepare pnpm@9.11.0 --activate

COPY ./package.json ./pnpm-lock.yaml ./

RUN pnpm install --frozen-lockfile

COPY ./ ./

RUN pnpm build

FROM nginx:stable-alpine AS production-stage

RUN chown -R nginx:nginx /usr/share/nginx/html \
    && chown -R nginx:nginx /var/cache/nginx \
    && chown -R nginx:nginx /var/log/nginx \
    && chown -R nginx:nginx /etc/nginx/conf.d \
    && touch /var/run/nginx.pid \
    && chown nginx:nginx /var/run/nginx.pid

COPY --chown=nginx:nginx --from=build-stage /app/dist /usr/share/nginx/html
COPY --chown=nginx:nginx nginx.conf /etc/nginx/nginx.conf

USER nginx

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
