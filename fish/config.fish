function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
starship init fish | source

set -gx EDITOR nvim
set -gx PATH ~/.config/emacs/bin $PATH
set -gx PATH /home/ryane/.cargo/bin $PATH
alias l "logo-ls -A -D -l -t"

function nvim-kickstart
	env NVIM_APPNAME=nvim-kickstart nvim
end

function nvim-astro
	env NVIM_APPNAME=nvim-astro nvim
end

function nvim-lazy
    env NVIM_APPNAME=nvim-lazy nvim
end

function nvim-chad
    env NVIM_APPNAME=nvim-chad nvim
end

function nvim-craftzdog
    env NVIM_APPNAME=nvim-craftzdog nvim
end

function nvims
    set items nvim-kickstart nvim-chad nvim-astro nvim-lazy nvim-craftzdog
    set config (printf "%s\n" $items | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
    if [ -z $config ]
        echo "Nothing selected"
        return 0
    else if [ $config = "default" ]
        set config ""
    end
    env NVIM_APPNAME=$config nvim $argv
end
bind \ca 'nvims\n'

# setup zoxide
zoxide init fish | source

