# Page Access Tracker

This is a backend of a javascript library that tracks the visitor's navigation throughout the site.

## Prerequisites

You need to have Elixir installed. Please refer to the [`official guide`](https://elixir-lang.org/install.html) for instructions.

## Instructions

To start your Phoenix server:

* Install dependencies with `mix deps.get`
* If you're gonna use postgres as the database, remember to change it's credentials at `config/dev.exs` and `config/test.exs`
* Create and migrate your database with `mix ecto.create && mix ecto.migrate`
* Install Node.js dependencies with `cd assets && npm install`
* Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Se você deseja ver o arquivo javascript que interagem com o backend, visite

If you wanna see the javascript file that interacts with the backend, you can check it at https://github.com/diegoleonardo/cdn-tracking-access
