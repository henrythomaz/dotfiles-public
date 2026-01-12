# fisher auto-install
if not functions -q fisher
    curl -sL https://git.io/fisher | source
end

# install plugins automaticamente
fisher update

# aliases
alias lg='lazygit'
