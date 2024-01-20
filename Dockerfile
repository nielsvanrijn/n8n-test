FROM n8nio/n8n

ARG PGPASSWORD
ARG PGHOST
ARG PGPORT
ARG PGDATABASE
ARG PGUSER

ARG USERNAME
ARG PASSWORD

ENV DB_TYPE=postgresdb
ENV DB_POSTGRESDB_DATABASE=$PGDATABASE
ENV DB_POSTGRESDB_HOST=$PGHOST
ENV DB_POSTGRESDB_PORT=$PGPORT
ENV DB_POSTGRESDB_USER=$PGUSER
ENV DB_POSTGRESDB_PASSWORD=$PGPASSWORD

ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=$USERNAME
ENV N8N_BASIC_AUTH_PASSWORD=$PASSWORD

ENV NODE_FUNCTION_ALLOW_EXTERNAL=moment


# Set a custom user to not have n8n run as root
USER root

# Installs latest Chromium (100) package.
# RUN apk add --no-cache \
#  chromium \
#  nss \
#  freetype \
#  harfbuzz \
#  ttf-freefont \
#  yarn

# Tell Puppeteer to skip installing Chrome. We'll be using the installed package.
# ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
#    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Install n8n-nodes-puppeteer
# RUN cd /usr/local/lib/node_modules/n8n && npm install n8n-nodes-puppeteer

# RUN cd /usr/local/lib/node_modules/ && npm install moment

CMD ["start"]
