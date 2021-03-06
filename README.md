# Dare

To start your Phoenix app:
  0. Start Postgres: `postgres -D /usr/local/var/postgres`
  1. Install dependencies with `mix deps.get`
  2. Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  3. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: http://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

## postgres troubleshooting
1. `psql -U <username> <database>`
2. show users and roles: `\du`
3. `ALTER USER <username> WITH SUPERUSER;`

# connect to db
1. `psql -U postgres`
2. show all tables: `\d`
3. show table: `\d <table-name>`
4. If getting error: that /usr/local/var/postgres was made w/ an older version of postgres
* `rm -rf /usr/local/var/postgres`
* `initdb -D /usr/local/var/postgres/`
