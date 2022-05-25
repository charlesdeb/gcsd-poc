# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

Edit the credentials locally using:

```bash
> EDITOR="nano" bin/rails credentials:edit
```

## Development

Since this project uses Tailwind, which compiles a custom style sheet, instead of starting the app with `rails s` use `./bin/dev` instead, which uses foreman to spin up the dev server _and_ watch all files so that `/app/assets/builds/tailwind.css` is rebuilt.

* Database creation

* Database initialization

## How to run the test suite

Tests built using (https://books.thoughtbot.com/assets/testing-rails.pdf) as a guide.

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
