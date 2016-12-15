base:
  'G@roles:mattermost':
    - golang
    - postgres-repo  
    - postgres-pkgs
    - postgres-service
    - mattermost

  'G@roles:nginx-EL7-lxbrand':
    - nginx-el7-lxbrand-workaround

  'G@roles:mattermost-nginx':
    - mattermost-nginx
