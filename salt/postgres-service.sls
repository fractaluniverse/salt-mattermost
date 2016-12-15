pg_initdb:
  cmd.run:
    - name: /usr/pgsql-9.6/bin/postgresql96-setup initdb
    - unless: ls /var/lib/pgsql/9.6/initdb.log

postgresql-9.6:
  service.running:
    - provider: systemd
    - reload: True

/var/lib/pgsql/9.6/data/pg_hba.conf:
  file.managed:
    - source: salt://pg_hba.conf
