namespace :nginx do
  desc "Copy nginx conf to sites-enabled"
  task :setup, roles: :web do
    template "nginx_unicorn.erb", "/tmp/nginx_conf"
    run "#{sudo} mv /tmp/nginx_conf /etc/nginx/sites-enabled/#{application}"    
    restart
  end
  after "deploy:setup", "nginx:setup"
  
  %w[start stop restart].each do |command|
    desc "#{command} nginx"
    task command, roles: :web do
      run "#{sudo} service nginx #{command}"
    end
  end
end