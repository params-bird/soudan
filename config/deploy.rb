set :default_env, {
  rbenv_root: "/usr/local/rbenv",
  path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH",
  AWS_ACCESS_KEY_ID: ENV["AWS_ACCESS_KEY_ID"],
  AWS_SECRET_ACCESS_KEY: ENV["AWS_SECRET_ACCESS_KEY"]
}


# secret.yaml（が必要の際に）デプロイする際の設定
# set :linked_files, %w{ config/secrets.yml }
# desc 'upload secrets.yml'
# task :upload do
#   on roles(:app) do |host|
#     if test "[ ! -d #{shared_path}/config ]"
#       execute "mkdir -p #{shared_path}/config"
#     end
#     upload!('config/secrets.yml', "#{shared_path}/config/secrets.yml")
#   end
# end
# before :starting, 'deploy:upload'
# after :finishing, 'deploy:cleanup'
# end