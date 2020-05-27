# To run command completion in ZSH, you need to run bashcompinit
autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws