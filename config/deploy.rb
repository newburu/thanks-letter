lock "~> 3.17.0"

# cloneするgitのレポジトリ
set :repo_url, ENV['DEPLOY_GIT_URL']

# deployするブランチ
set :branch, ENV['DEPLOY_BRANCH']

# シンボリックリンクをはるファイル
append :linked_files, ".env", "config/database.yml", "config/credentials/production.key"

# シンボリックリンクをはるフォルダ
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "tmp/webpacker", "public/system", "vendor", "storage", "public/uploads"

# 保持するバージョンの個数
set :keep_releases, 5

# rbenvの設定
set :rbenv_type, :user
set :rbenv_ruby, '3.1.1'

# ここからUnicornの設定
# Unicornのプロセスの指定
set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

# Unicornの設定ファイルの指定
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }

# Unicornを再起動するための記述
after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
