zsh-zshrc:
  file.managed:
    - name: {{ grains.homedir }}/.zshrc
    - source: salt://zsh/zshrc
    - user: {{ grains.user }}

zsh-dir:
  file.directory:
    - name: {{ grains.homedir }}/.zsh
    - user: {{ grains.user }}

zsh-powerlevel9k:
  git.cloned:
    - name: https://github.com/bhilburn/powerlevel9k.git
    - target: {{ grains.homedir }}/.zsh/powerlevel9k/
    - user: {{ grains.user }}

zsh-autosuggestions:
  git.cloned:
    - name: https://github.com/zsh-users/zsh-autosuggestions.git
    - target: {{ grains.homedir }}/.zsh/zsh-autosuggestions/
    - user: {{ grains.user }}

zsh-completions:
  git.cloned:
    - name: https://github.com/zsh-users/zsh-completions.git
    - target: {{ grains.homedir }}/.zsh/zsh-completions/
    - user: {{ grains.user }}

zsh-syntax-highlighting:
  git.cloned:
    - name: https://github.com/zsh-users/zsh-syntax-highlighting.git
    - target: {{ grains.homedir }}/.zsh/zsh-syntax-highlighting/
    - user: {{ grains.user }}
