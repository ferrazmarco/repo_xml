FROM elixir:1.13.3-alpine

RUN apk update && apk add bash
RUN apk --update add postgresql-client

RUN mkdir /app
COPY . /app
WORKDIR /app

RUN mix local.hex --force && \
    mix local.rebar --force 

RUN mix do deps.get, deps.compile

EXPOSE 4000
CMD mix phx.server