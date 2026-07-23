#!/usr/bin/env bash
set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rails db:drop
DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rails db:create
bundle exec rails db:schema:load
bundle exec rails db:seed