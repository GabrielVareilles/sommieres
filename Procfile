release: bundle exec rails db:migrate
web: bundle exec puma -C config/puma.rb
assets: bin/webpack-dev-server
worker: bundle exec sidekiq -C config/sidekiq.yml