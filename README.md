# Task Manager Backend
In brief this is the api backend to a task management backend. This will be the boot up backend for a react font end to be loaded on a separate node server

## Prereq
- Ruby 2.4.2 or better
- Nodejs
- what ever sql database jazz you want to set up... cause yeah

## Up and Going
Make sure prerequisits are installed, this is currently set up to just work with sqlite3, which does require an install on the ubuntu client I'm loading this on.

### Get it going
- run `bundle`
- run `rails db:migrate`
- run `rails test` (verify tests are up to snuff)
- run `rails server`

You should be all set to play with it locally

# Future plans
- Set up cors to lock down the requests
- incorporate JWT and some Oauth sign in
- User can create a group
- Set User who creates group as it's admin
- Invites person to group
- Assign tasks to users that are part of a group
- Assign Teams in a group