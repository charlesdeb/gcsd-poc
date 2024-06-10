# GCSD

A demo app for multi-lingual, multi-timezone, multi-session events

It uses:

- Administrate for a quick developer friendly admin UI (but less nice for real users)
- Luxon (Javascript) for timezones
- Tailwind for styling
- Devise for authentication
- Mobility for model translations
- ActiveStorage for images

## Setup

1. Pull down the app from version control
2. Make sure you have postgres running
3. ... database setup stuff
4. bundle install

## Running the app locally

Since this project uses Tailwind, which compiles a custom style sheet, instead of starting the app with `rails s` use `./bin/dev` instead, which uses foreman to spin up the dev server _and_ watch all files so that `/app/assets/builds/tailwind.css` is rebuilt.

1. `bin/dev`

## Tests and CI

1. `bin/ci` contains all the tests and checks for the app
2. `tmp/test.log` will use the production logging format _not_ the development one.

To run JS tests, you'll need Chromedriver running. Visit <https://googlechromelabs.github.io/chrome-for-testing/#stable> to get it.

## Production

- All runtime configuration should be supplied in the UNIX environment
- Rails logging uses lograge.
- Deployed with fly.io. To deploy:

```bash
> flyctl deploy --config ./fly.production.toml --dockerfile ./Dockerfile.production
```

## Staging

- All runtime configuration should be supplied in the UNIX environment
- Rails logging uses lograge.
- Staging is pointing at the same S3 compatible storage as production
- Deployed with fly.io. To deploy:

```bash
> flyctl deploy --config ./fly.staging.toml --dockerfile ./Dockerfile.staging
```
