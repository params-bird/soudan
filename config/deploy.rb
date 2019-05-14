set :default_env, {
  rbenv_root: "/usr/local/rbenv",
  path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH",
  aws_ACCESS_KEY_ID: ENV['S3_ACCESS_KEY_ID'],
  aws_SECRET_ACCESS_KEY: ENV['S3_SECRET_ACCESS_KEY']
}


# secret.yaml（が必要の際に）デプロイする際の設定
set :linked_files, %w{ config/secrets.yml }
desc 'upload secrets.yml'
task :upload do
  on roles(:app) do |host|
    if test "[ ! -d #{shared_path}/config ]"
      execute "mkdir -p #{shared_path}/config"
    end
    upload!('config/secrets.yml', "#{shared_path}/config/secrets.yml")
  end
end
before :starting, 'deploy:upload'
after :finishing, 'deploy:cleanup'
end