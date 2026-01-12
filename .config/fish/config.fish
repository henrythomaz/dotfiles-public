set fish_greeting ""

set -gx TERM xterm-255color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 2
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
alias c claude
alias claude-yolo "claude --dangerously-skip-permissions"
command -qv nvim && alias vim nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

# Função de busca web personalizada
function search
    # Detecta padrão "api username repo"
    if test "$argv[1]" = api
        set username $argv[2]
        set repo $argv[3]
        wslview "https://api.github.com/repos/$username/$repo"
        return
    end

    # Verifica se o primeiro argumento começa com "site:"
    if string match -q "site:*" $argv[1]
        # Extrai o domínio/username (remove "site:")
        set site (string replace "site:" "" $argv[1])
        # Pega o resto da query (palavras após site:)
        set query (string join "+" $argv[2..-1])

        # Abre a busca DENTRO do site
        switch $site
            case "github.com"
                wslview "https://github.com/search?q=$query"
            case "reddit.com"
                wslview "https://www.reddit.com/search/?q=$query"
            case "stackoverflow.com"
                wslview "https://stackoverflow.com/search?q=$query"
            case "youtube.com"
                wslview "https://www.youtube.com/results?search_query=$query"
            case "wikipedia.org"
                wslview "https://en.wikipedia.org/wiki/Special:Search?search=$query"
            case "chatgpt.com" "openai.com"
                wslview "https://chatgpt.com/?q=$query"
            case "perplexity.ai"
                wslview "https://www.perplexity.ai/?q=$query"
            case "claude.ai"
                wslview "https://claude.ai/new?q=$query"
            case henrythomaz
                # Abre repo específico do seu GitHub
                set repo (string replace "+" "" $query)
                wslview "https://github.com/henrythomaz/$repo"
            case "*"
                # Para outros sites, usa Google site:
                wslview "https://www.google.com/search?q=site:$site+$query"
        end
    else
        # Pesquisa normal no Google
        set query (string join "+" $argv)
        wslview "https://www.google.com/search?q=$query"
    end
end
