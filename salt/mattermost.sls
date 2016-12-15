mattermost-group:
  group.present:
    - name: mattermost
    - gid: 8065

mattermost-user:
  user.present:
    - name: mattermost
    - shell: /usr/bin/bash
    - home: /home/mattermost
    - uid: 8065
    - gid: 8065
    - groups:

mattermost-pg-user:
  postgres_user.present:
    - name: mattermost
    - default_password: {{ pillar['mattermost_pguserdbpass'] }}
#    - db_user: mattermost
#    - db_password: mattermost

mattermost-pg-db:
  postgres_database.present:
    - name: mattermost
    - owner: mattermost

mattermost-unpacked:
  archive.extracted:
#    - source: salt://tarballs/mattermost-team-{{ pillar['version_mattermost'] }}-linux-amd64.tar.gz
    - source: https://releases.mattermost.com/{{ pillar['version_mattermost'] }}/mattermost-team-{{ pillar['version_mattermost'] }}-linux-amd64.tar.gz
    - source_hash: sha256=2c6bc8b1c25e48d1ac887cd6cbef77df1f80542127b4d98c4d7c0dfbfade04d5
#    - if_missing: /opt/mattermost-{{ pillar['version_mattermost'] }}-linux-amd64/
    - if_missing: /opt/mattermost
    - name: /opt/
    - user: root
    - group: mattermost
    - archive_format: tar
    - tar_options: z
    - require:
      - sls: golang

/opt/mattermost/logs:
  file.directory:
    - owner: mattermost

/opt/mattermost/logs/mattermost.log:
  file.managed:
    - owner: mattermost

/opt/mattermost/config/config.json:
  file.managed:
    - template: jinja
    - source: salt://config.json

/etc/systemd/system/mattermost.service:
  file.managed:
    - template: jinja
    - source: salt://mattermost.service

mattermost-service:
  service.running:
    - name: mattermost
    - enabled: True

#/opt/mattermost:
#  file.symlink:
#    - target: /opt/mattermost-{{ pillar['version_mattermost'] }}-linux-amd64/
