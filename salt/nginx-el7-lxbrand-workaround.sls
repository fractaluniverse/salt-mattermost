# nginx included in EPEL Repo will fail on "systemctl start nginx" due
# to a namespace problem, a workaround is to disable PrivateTmp
/usr/lib/systemd/system/nginx.service:
  file.managed:
    - source: salt://nginx.service
