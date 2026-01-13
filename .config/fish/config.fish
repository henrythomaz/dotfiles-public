set fish_greeting ""

set -gx TERM xterm-256color

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
        source ~/dotfiles-public/.config/fish/config-osx.fish
    case Linux
        source ~/dotfiles-public/.config/fish/config-linux.fish
    case '*'
        source ~/dotfiles-public/.config/fish/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

function search
    # 0) Modo API: search api user repo
    if test "$argv[1]" = api
        set username $argv[2]
        set repo $argv[3]
        wslview "https://api.github.com/repos/$username/$repo"
        return
    end

    # 1) Modo GitHub direto com gh:
    # Exemplos:
    #   search gh:craftzdog                -> https://github.com/craftzdog
    #   search gh:henrythomaz main         -> https://github.com/henrythomaz/tree/main
    #   search gh:henrythomaz estudies/02-backend
    #   search gh:craftzdog nvim-05 dotfiles-public
    if string match -q "gh:*" $argv[1]
        set user (string replace "gh:" "" $argv[1])

        # sem nada depois -> perfil
        if test (count $argv) -eq 1
            wslview "https://github.com/$user"
            return
        end

        # CASO ESPECIAL: gh:USER BRANCH REPO[/PATH...]
        # ex: search gh:craftzdog nvim-05 dotfiles-public
        # -> https://github.com/craftzdog/dotfiles-public/tree/nvim-05/
        if test (count $argv) -ge 3
            set branch $argv[2]
            set repo_and_rest (string split "/" (string join "/" $argv[3..-1]))
            set repo $repo_and_rest[1]
            set folder (string join "/" $repo_and_rest[2..-1])

            if test -n "$repo"
                if test -n "$folder"
                    wslview "https://github.com/$user/$repo/tree/$branch/$folder"
                else
                    wslview "https://github.com/$user/$repo/tree/$branch"
                end
                return
            end
        end

        # se o segundo argumento for "main"
        if test "$argv[2]" = main
            if test (count $argv) -eq 2
                wslview "https://github.com/$user/tree/main"
                return
            end

            set path (string join "/" $argv[3..-1])
            set parts (string split "/" $path)
            set repo $parts[1]
            set folder (string join "/" $parts[2..-1])

            if test -z "$folder"
                wslview "https://github.com/$user/$repo/tree/main"
            else
                wslview "https://github.com/$user/$repo/tree/main/$folder"
            end
            return
        end

        # Default: gh:USER repo[/folder...]
        set path (string join "/" $argv[2..-1])
        set parts (string split "/" $path)
        set repo $parts[1]
        set folder (string join "/" $parts[2..-1])

        if test -z "$repo"
            wslview "https://github.com/$user"
        else if test -z "$folder"
            wslview "https://github.com/$user/$repo"
        else
            wslview "https://github.com/$user/$repo/tree/main/$folder"
        end
        return
    end

    # 2) Modo email / Gmail:
    #   search gmail email assunto corpo...
    #   ex: search gmail natasha@gmail.com "Oi ÊEÊÊÊ" "oi, tudo bem?"
    if test "$argv[1]" = gmail
        set email $argv[2]
        set subject ""
        set body ""

        if test (count $argv) -ge 3
            set subject $argv[3]
        end

        if test (count $argv) -ge 4
            set body (string join " " $argv[4..-1])
        end

        # encode simples de espaços pra %20
        set subject_enc (string replace " " "%20" $subject)
        set body_enc (string replace " " "%20" $body)

        wslview "https://mail.google.com/mail/?view=cm&fs=1&to=$email&su=$subject_enc&body=$body_enc"
        return
    end

    # 3) Modo site: para sites específicos (github/youtube/facebook/stackoverflow/etc.)
    if string match -q "site:*" $argv[1]
        set site (string replace "site:" "" $argv[1])
        set query (string join "+" $argv[2..-1])

        switch $site
            case "github.com"
                wslview "https://github.com/search?q=$query"
            case "youtube.com"
                wslview "https://www.youtube.com/results?search_query=$query"
            case "facebook.com"
                wslview "https://www.facebook.com/search/top/?q=$query"
            case "stackoverflow.com"
                wslview "https://stackoverflow.com/search?q=$query"
            case "reddit.com"
                wslview "https://www.reddit.com/search/?q=$query"
            case "wikipedia.org"
                wslview "https://en.wikipedia.org/wiki/Special:Search?search=$query"
            case "chatgpt.com" "openai.com"
                wslview "https://chatgpt.com/?q=$query"
            case "perplexity.ai"
                wslview "https://www.perplexity.ai/?q=$query"
            case "claude.ai"
                wslview "https://claude.ai/new?q=$query"
            case "*"
                wslview "https://www.google.com/search?q=site:$site+$query"
        end
        return
    end

    # 4) Busca normal no Google
    set query (string join "+" $argv)
    wslview "https://www.google.com/search?q=$query"
end
