# BASE
FROM elixir:1.14-alpine

WORKDIR /app
COPY . /app

RUN mix do local.hex --force, local.rebar --force, deps.get
