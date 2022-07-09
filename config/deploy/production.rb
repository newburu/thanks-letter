# デプロイするアプリケーション名
set :application, ENV['PRODUCTION_DEPLOY_APP_NAME']

server ENV['PRODUCTION_SERVER_IP'], user: ENV['PRODUCTION_SERVER_USER'], roles: %w{app db web}, port: ENV['PRODUCTION_SERVER_PORT'] 

set :ssh_options, {
  auth_methods: ['publickey'], 
  keys: ENV['PRODUCTION_SERVER_SSH_KEY'],
}

# deploy先のディレクトリ
set :deploy_to, "/home/#{ENV['PRODUCTION_SERVER_USER']}/#{ENV['PRODUCTION_DEPLOY_APP_NAME']}"
set :deploy_via, :remote_cache
