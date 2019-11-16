FROM olliv/zekedock

RUN cd /tmp && \
    wget https://nodejs.org/dist/v6.11.0/node-v6.11.0-linux-x64.tar.xz && \
    cd /usr/local && \
    tar --strip-components 1 -xf /tmp/node-v6.11.0-linux-x64.tar.xz && \
    mkdir -p /app && \
    useradd -d /home/term -m -s /bin/bash term
COPY package.json /app/
WORKDIR /app
RUN npm install
COPY . /app

USER term
EXPOSE 3000
CMD ["node", "app.js", "-p", "3000"]
