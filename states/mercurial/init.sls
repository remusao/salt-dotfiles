mercurial-config:
  file.managed:
    - name: {{ grains.homedir }}/.hgrc
    - source: salt:///mercurial/hgrc
    - user: {{ grains.user }}
    - force: True
