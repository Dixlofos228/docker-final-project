# Внешний URL GitLab
external_url 'http://localhost:8081'

# Настройки Puma (веб-сервер)
puma['listen'] = '127.0.0.1'
puma['port'] = 8080
puma['worker_processes'] = 2
puma['min_threads'] = 4
puma['max_threads'] = 4

# Настройки nginx
nginx['enable'] = true
nginx['listen_port'] = 80
nginx['listen_https'] = false
nginx['proxy_set_headers'] = {
  "X-Forwarded-Proto" => "http",
  "X-Forwarded-Ssl" => "off",
  "X-Forwarded-For" => "$proxy_add_x_forwarded_for",
  "X-Real-IP" => "$remote_addr"
}

# Настройки SSH
gitlab_rails['gitlab_shell_ssh_port'] = 2222

### LDAP Settings
gitlab_rails['ldap_enabled'] = true

###! **remember to close this block with 'EOS' below**
gitlab_rails['ldap_servers'] = YAML.load <<-'EOS'
main:
  label: 'LDAP'
  host: 'ldap'
  port: 389
  uid: 'uid'
  bind_dn: 'cn=admin,dc=ignatenko,dc=ru'
  password: 'admin'
  encryption: 'plain'
  active_directory: false
  allow_username_or_email_login: true
  lowercase_usernames: true
  block_auto_created_users: false
  base: 'dc=ignatenko,dc=ru'
  user_filter: ''
  attributes:
    username: ['uid', 'userid', 'sAMAccountName']
    email: ['mail', 'email', 'userPrincipalName']
    name: 'cn'
    first_name: 'givenName'
    last_name: 'sn'
EOS

# Дополнительные настройки
gitlab_rails['time_zone'] = 'UTC'
gitlab_rails['gitlab_email_enabled'] = false
gitlab_rails['smtp_enable'] = false

# Оптимизация памяти (для уменьшения потребления)
sidekiq['max_concurrency'] = 10
postgresql['shared_buffers'] = "256MB"
postgresql['max_worker_processes'] = 2
