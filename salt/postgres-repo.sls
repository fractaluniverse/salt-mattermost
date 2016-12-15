/etc/yum.repos.d/pgdg-96-centos.repo:
  file.managed:
    - source: salt://pgdg-96-centos.repo

/etc/pki/rpm-gpg/RPM-GPG-KEY-PGDG-96:
  file.managed:
    - source: salt://RPM-GPG-KEY-PGDG-96
