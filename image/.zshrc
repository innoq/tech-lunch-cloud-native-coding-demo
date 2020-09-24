export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(
  git
  kubectl
  docker
  kube-ps1
)

source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(stern --completion=zsh)
source <(k completion zsh)
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH":/usr/local/go/bin::/usr/local/kubebuilder/bin

PROMPT=$PROMPT'$(kube_ps1) '

export DOCKER_HOST=tcp://0.0.0.0:2375
