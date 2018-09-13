# Official Elixir docker repo: https://hub.docker.com/r/_/elixir/
FROM elixir:1.7.2-alpine

RUN mkdir -p app

WORKDIR /app

COPY . /app

RUN mix local.hex --force 
RUN mix local.rebar --force
RUN mix deps.get
RUN mix compile

ENV PORT=80

EXPOSE 80

CMD ["mix", "run", "--no-halt"]
