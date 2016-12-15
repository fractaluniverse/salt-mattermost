nginx:
  pkg.installed

/etc/nginx/conf.d/mattermost_.conf:
  file.managed:
    - template: jinja
    - source: salt://nginx-mattermost_.conf
