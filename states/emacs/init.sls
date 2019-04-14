emacs-config:
  file.managed:
    - name: {{ grains.homedir }}/.emacs.el
    - source: salt://emacs/emacs
    - user: {{ grains.user }}
