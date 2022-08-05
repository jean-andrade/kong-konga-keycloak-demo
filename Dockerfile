FROM amd64/kong:latest

USER root
RUN apk update && apk add curl git gcc musl-dev && \
  luarocks install luaossl OPENSSL_DIR=/usr/local/kong CRYPTO_DIR=/usr/local/kong && \
  luarocks install lua-resty-openidc && \
  luarocks install --pin lua-resty-jwt && \
  luarocks install kong-oidc && \
  luarocks install kong-jwt2header && \
  luarocks install kong-upstream-jwt
USER kong
