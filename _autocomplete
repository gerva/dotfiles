if [ -e "$HOME/.configuration" ]; then
    source "$HOME/.configuration"
fi

# ssh autocompletion (source)
# http://serverfault.com/questions/170361/how-to-edit-command-completion-for-ssh-on-bash
SSH_COMPLETE=( $(cut -f1 -d' ' ~/.ssh/known_hosts |\
                 tr ',' '\n' |\
                 sort -u |\
                 grep -e '[:alpha:]') )
complete -o default -W "${SSH_COMPLETE[*]}" ssh


# git completion bash
if [ -e "$GIT_COMPLETION_BASH" ]; then
    source "$GIT_COMPLETION_BASH"
fi


