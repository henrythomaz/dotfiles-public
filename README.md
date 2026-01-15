# Henry's Dotfiles

> Meu ambiente pessoal de desenvolvimento – Neovim, Fish shell, Git, Tmux e PowerShell.

**⚠️ Aviso**: Não use essas configurações cegamente se você não souber o que está fazendo. Use por sua conta e risco.

---

## 📦 Conteúdo do repositório

- `nvim/` – configuração completa do **Neovim** (LazyVim + plugins)
- `tmux/` – configuração do **tmux**
- `git/` – aliases e opções de **Git**
- `fish/` – configuração do **Fish shell** (Linux/macOS)
- `powershell/` – configuração do **PowerShell** (Windows)

> Os caminhos exatos podem variar conforme seu repositório, ajuste conforme a sua estrutura.

---

## 🧠 Visão geral do Neovim

Minha config do Neovim é baseada em **LazyVim**, focada em desenvolvimento web (TypeScript, JavaScript, React, Node.js) e produtividade no terminal.

### ✅ Requisitos

- Neovim ≥ **0.9.0** (compilado com **LuaJIT**)
- Git ≥ **2.19.0** (para suporte a *partial clones*)
- [LazyVim](https://www.lazyvim.org/)
- [Nerd Font](https://www.nerdfonts.com/) (v3.0 ou maior) – para ícones
- [lazygit](https://github.com/jesseduffield/lazygit) *(opcional)*
- Compilador **C** (para `nvim-treesitter`)
- Para [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) *(opcional)*:
  - `ripgrep` – para **live grep**
  - `fd` – para **find files**
- Terminal com true color e *undercurl*:
  - [kitty](https://github.com/kovidgoyal/kitty)
  - [wezterm](https://github.com/wez/wezterm)
  - [alacritty](https://github.com/alacritty/alacritty)
  - [iTerm2](https://iterm2.com/) (macOS)
- Tema: [Solarized Osaka](https://github.com/craftzdog/solarized-osaka.nvim)

---

## ⌨️ GUIA COMPLETO DE ATALHOS

> **Leader Key**: `<Space>` (barra de espaço)

### 🎯 Leader Key

```
<Space> = Leader (tecla modificadora principal)
```

---

### 📁 File Operations

#### Salvar/Fechar

```
<Space>w          Salvar arquivo (:update)
<Space>q          Fechar janela (:quit)
<Space>Q          Fechar tudo (:qa)
```

#### File Explorer (NvimTree)

```
<Space>e          Toggle NvimTree
<Space>f          Find file no NvimTree
<Space>t          Toggle NvimTree (alias)
```

**Dentro do NvimTree:**

```
t                 Abrir em nova tab
Enter             Abrir arquivo
h                 Voltar diretório
N                 Criar novo arquivo/pasta
d                 Deletar
r                 Renomear
```

---

### 🔍 Telescope (Busca)

#### Busca de Arquivos

```
;f                Find files (arquivos no projeto)
;r                Live grep (buscar texto em arquivos)
sf                File browser (navegador de arquivos)
<Space>fP         Find plugin files
<Space>fp         Find files (LazyVim padrão)
<Space>ff         Find files
<Space>fF         Find files (root dir)
<Space>fr         Recent files
<Space>fR         Recent files (cwd)
<Space>fb         Buffers
<Space>fg         Git files
```

#### Busca de Conteúdo

```
;;                Resume última busca
\\                Lista buffers abertos
;e                Diagnostics (erros LSP)
;s                Treesitter symbols
;t                Help tags
;c                LSP incoming calls
<Space>sw         Grep word under cursor
<Space>sW         Grep word (root dir)
<Space>sg         Grep (root)
<Space>sG         Grep (cwd)
<Space>ss         Search symbols
<Space>sS         Search symbols (workspace)
```

#### Git/Search Avançado

```
<Space>gc         Git commits
<Space>gs         Git status
<Space>gS         Git stash
<Space>s"         Registers
<Space>sa         Auto commands
<Space>sb         Buffer
<Space>sc         Command history
<Space>sC         Commands
<Space>sd         Document diagnostics
<Space>sD         Workspace diagnostics
<Space>sh         Help pages
<Space>sH         Search highlight groups
<Space>sj         Jumplist
<Space>sk         Keymaps
<Space>sl         Location list
<Space>sM         Man pages
<Space>sm         Marks
<Space>so         Options
<Space>sR         Resume
<Space>sq         Quickfix
```

---

### 💻 LSP (Language Server)

#### Navegação

```
gd                Goto Definition (Telescope)
gD                Goto Declaration
gr                Goto References
gi                Goto Implementation
gy                Goto Type Definition
K                 Hover documentation
gK                Signature help
<C-j>             Next diagnostic
[d                Previous diagnostic
]d                Next diagnostic
```

#### Code Actions

```
<Space>ca         Code actions
<Space>cA         Code actions (source)
<Space>rn         Rename symbol
<Space>cf         Format document
<Space>cF         Format injected langs
```

#### Refactoring (Visual mode)

```
<Space>r          Menu de refactoring
<Space>re         Extract Function
<Space>rf         Extract Function To File
<Space>rv         Extract Variable
<Space>ri         Inline Variable
<Space>rb         Extract Block
```

#### LSP Info

```
<Space>cl         LSP Info
<Space>cm         Mason (gerenciar LSP)
<Space>cR         Restart LSP
```

#### Toggle LSP Features

```
<Space>i          Toggle inlay hints
:ToggleAutoformat Toggle autoformat on save
```

---

### 🎨 Copilot

#### Sugestões

```
<C-l>             Aceitar sugestão completa
<M-l>             Aceitar palavra (Alt+L)
<M-S-l>           Aceitar linha (Alt+Shift+L)
<M-]>             Próxima sugestão (Alt+])
<M-[>             Sugestão anterior (Alt+[)
<C-]>             Descartar sugestão
```

#### Comandos

```
:Copilot auth     Autenticar Copilot
:Copilot status   Ver status
:Copilot enable   Habilitar
:Copilot disable  Desabilitar
```

---

### 🧪 Testing (Neotest)

```
;tt               Run file tests
;tr               Run nearest test
;tT               Run ALL tests
;tl               Run last test
;ts               Toggle test summary
;to               Show test output
;tO               Toggle output panel
;tS               Stop tests
<Space>t          Test menu (LazyVim)
<Space>tt         Run nearest test
<Space>tT         Run all tests
<Space>tw         Toggle test watch
<Space>ta         Test attach
```

---

### 🔄 Git (LazyGit & Git.nvim)

```
;c                Abrir LazyGit
<Space>gb         Git blame
<Space>go         Abrir no GitHub/GitLab
<Space>gg         LazyGit (root)
<Space>gG         LazyGit (cwd)
<Space>gl         Git log
<Space>gL         Git log (cwd)
<Space>gf         LazyGit file history
<Space>gF         LazyGit file history (cwd)
```

---

### 📝 Editing

#### Basic Motions (com Cowboy! 🤠)

```
h, j, k, l        Movimentos básicos (aviso se usar >10x)
+                 Incrementar número
-                 Decrementar número
<C-a>             Select all
dw                Delete word backwards
x                 Delete char (sem afetar register)
```

#### Increment/Decrement Avançado (Dial.nvim)

```
<C-a>             Incrementa (números, datas, true/false, let/const)
<C-x>             Decrementa
```

#### Comentários

```
gcc               Comment line
gc (visual)       Comment selection
gcO               Comment insert above
gco               Comment insert below
```

#### Indentação

```
<                 Decrease indent
>                 Increase indent
=                 Auto indent
```

#### Registers Especiais (não afetam clipboard)

```
<Space>p          Paste do register 0
<Space>P          Paste do register 0 (antes)
<Space>d          Delete sem copiar
<Space>D          Delete line sem copiar
<Space>c          Change sem copiar
<Space>C          Change line sem copiar
```

#### Linha nova sem continuar comentário

```
<Space>o          Nova linha abaixo (sem comment)
<Space>O          Nova linha acima (sem comment)
```

---

### 🪟 Windows & Tabs

#### Split Windows

```
ss                Split horizontal
sv                Split vertical
sh                Move to left window
sk                Move to top window
sj                Move to bottom window
sl                Move to right window
```

#### Resize Windows

```
<C-w><left>       Decrease width
<C-w><right>      Increase width
<C-w><up>         Increase height
<C-w><down>       Decrease height
```

#### Tabs

```
te                New tab (:tabedit)
<Tab>             Next tab
<Shift-Tab>       Previous tab
tw                Close tab
```

#### Buffers

```
<Space>bb         Switch to other buffer
<Space>bd         Delete buffer
<Space>bD         Delete buffer and window
<Space>th         Close hidden buffers
<Space>tu         Close nameless buffers
```

---

### 🎯 Mini.bracketed (Navegação com [])

```
]b / [b           Next/Previous buffer
]c / [c           Next/Previous comment
]d / [d           Next/Previous diagnostic
]f / [f           Next/Previous file
]n / [n           Next/Previous treesitter node
]q / [q           Next/Previous quickfix
]t / [t           Next/Previous todo comment
]w / [w           Next/Previous window
]x / [x           Next/Previous quickfix list
```

---

### 🎨 UI & Visual

#### Zen Mode

```
<Space>z          Toggle Zen Mode (foco total)
```

#### Notifications

```
<Space>un         Dismiss notifications
<Space>sn         Noice history
<Space>snt        Noice telescope
```

#### Which-Key (ver atalhos)

```
<Space>           Espere 500ms → mostra menu de atalhos
<Space>?          Show keymaps
:Telescope keymaps Lista TODOS os keybinds
```

#### Color Utilities

```
<Space>r          Convert HEX to HSL (linha atual)
```

**Exemplo:**

```css
color: #ff0000;  → <Space>r → color: hsl(0, 100%, 50%);
```

---

### 🔧 Plugin Management (Lazy.nvim)

```
<Space>l          Lazy menu
<Space>ll         Lazy
<Space>lx         Lazy clean
<Space>ls         Lazy sync
<Space>lu         Lazy update
<Space>lp         Lazy profile
<Space>lr         Lazy restore
<Space>lc         Lazy check
```

---

### 🗄️ Database (vim-dadbod) - Se habilitado

```
<Space>db         Toggle Database UI
```

---

### 🌲 Treesitter

```
:TSPlaygroundToggle    Toggle syntax tree viewer
:InspectTree           Inspect syntax tree
:TSUpdate              Update parsers
<C-space>              Incremental selection (expand)
<BS>                   Decremental selection
```

---

### ⚡ Session Management

```
<Space>qs         Restore session
<Space>qS         Restore session (current dir)
<Space>ql         Restore last session
<Space>qd         Don't save session
```

---

### 🐛 DAP (Debugger) - Se configurado

```
<Space>dB         Breakpoint condition
<Space>db         Toggle breakpoint
<Space>dc         Continue
<Space>da         Continue (attach)
<Space>dC         Run to cursor
<Space>dg         Go to line
<Space>di         Step into
<Space>dj         Down
<Space>dk         Up
<Space>dl         Run last
<Space>do         Step out
<Space>dO         Step over
<Space>dp         Pause
<Space>dr         Toggle REPL
<Space>ds         Session
<Space>dt         Terminate
<Space>dw         Widgets
<Space>de         Eval
<Space>du         Toggle DAP UI
```

---

### 📊 Yanky (Clipboard History)

```
y                 Yank (com histórico)
p                 Paste (com histórico)
<Space>p          Paste histórico (Telescope)
```

---

### 🔍 Outros Utilitários

#### Terminal

```
<C-/>             Toggle terminal
<C-_>             Toggle terminal (alternativo)
<Esc><Esc>        Exit terminal mode
```

#### Jumplist

```
<C-m>             Jump forward (Ctrl+i alternativo)
<C-o>             Jump backward
```

#### Macros

```
qq                Record macro q
@q                Play macro q
Q                 Play last macro
```

---

### 🎮 Modo Visual

```
J                 Move linha down
K                 Move linha up
<                 Indent left
>                 Indent right
<Space>p          Paste do register 0
<Space>d          Delete sem copiar
<Space>c          Change sem copiar
gc                Comment selection
<Space>r          Refactoring menu
```

---

### 🚀 LazyVim Extras

#### UI Toggles

```
<Space>uf         Toggle format on save
<Space>uF         Toggle autoformat (global)
<Space>us         Toggle spelling
<Space>uw         Toggle wrap
<Space>uL         Toggle relative line numbers
<Space>ul         Toggle line numbers
<Space>ud         Toggle diagnostics
<Space>uc         Toggle conceal
<Space>uh         Toggle inlay hints
<Space>uT         Toggle treesitter highlight
<Space>ub         Toggle background (dark/light)
<Space>uu         Toggle UI components
```

#### Tabs/Windows (LazyVim)

```
<Space><tab><tab> New tab
<Space><tab>d     Close tab
<Space><tab>l     Last tab
<Space><tab>f     First tab
<Space><tab>]     Next tab
<Space><tab>[     Previous tab
```

---

### 📦 Todo Comments

```
]t                Next todo comment
[t                Previous todo comment
<Space>st         Todo (Telescope)
<Space>sT         Todo/Fix/Fixme (Telescope)
<Space>xt         Todo (Trouble)
<Space>xT         Todo/Fix/Fixme (Trouble)
```

---

### 🔥 Trouble (Error List)

```
<Space>xx         Toggle Trouble
<Space>xX         Toggle Trouble (buffer)
<Space>cs         Trouble symbols
<Space>cS         Trouble LSP
<Space>xL         Location list (Trouble)
<Space>xQ         Quickfix (Trouble)
```

---

## 🧵 Fluxo de trabalho com Tmux

> Supondo que você usa uma config inspirada no vídeo do ThePrimeagen / craftzdog.

### Atalhos básicos

- `Prefix` (normalmente `Ctrl+b` ou `Ctrl+a` se remapeado)
- `Prefix + c` – Nova janela
- `Prefix + ,` – Renomear janela
- `Prefix + n` / `Prefix + p` – Próxima / anterior janela
- `Prefix + %` – Split vertical
- `Prefix + "` – Split horizontal
- `Prefix + h/j/k/l` – Mover entre panes (se mapeado)
- `Prefix + x` – Fechar pane

### Integração com Neovim

- Use tmux para dividir **tarefas** (logs, testes, editor) e Neovim para dividir **arquivo/código**.
- Exemplo: uma janela com `nvim`, outra com `npm run dev`, outra com `lazygit`.

---

## 🐟 Shell (Fish) – macOS & Linux

### Ferramentas usadas

- [Fish shell](https://fishshell.com/)
- [Fisher](https://github.com/jorgebucaran/fisher) – Gerenciador de plugins
- [Tide](https://github.com/IlanCosman/tide) – Tema de prompt
- [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts) – Fontes patchadas
  - Pessoais: [PlemolJP](https://github.com/yuru7/PlemolJP) e BlexMono
- [z para fish](https://github.com/jethrokuan/z) – Pulo de diretório
- [eza](https://github.com/eza-community/eza) – Substituto moderno do `ls`
- [ghq](https://github.com/x-motemen/ghq) – Organizador de repositórios Git locais
- [fzf.fish](https://github.com/PatrickF1/fzf.fish) – Fuzzy finder

### Exemplos úteis de uso

- `z proj` – Ir rapidamente para diretório que contém `proj` no caminho
- `eza -lah` – Listagem bonita com ícones e detalhes
- `ghq list` – Listar repositórios gerenciados pelo `ghq`
- `ghq get user/repo` – Clonar repositório para o path do `ghq`
- `Ctrl+r` (com fzf) – Histórico com fuzzy search

---

## 🪟 PowerShell – Windows

### Ferramentas usadas

- [Scoop](https://scoop.sh/) – Instalador via linha de comando
- [Git for Windows](https://gitforwindows.org/)
- [Oh My Posh](https://ohmyposh.dev/) – Engine de tema de prompt
- [Terminal Icons](https://github.com/devblackops/Terminal-Icons) – Ícones em diretórios
- [PSReadLine](https://docs.microsoft.com/en-us/powershell/module/psreadline/) – Autocompletar e edição
- [z](https://www.powershellgallery.com/packages/z) – Pulo de diretório
- [PSFzf](https://github.com/kelleyma49/PSFzf) – Fuzzy finder

### Exemplos de fluxo

- `scoop install neovim git nodejs` – Instala ferramentas básicas
- Tema do prompt via Oh My Posh com ícones e Git status
- Uso de `z` para navegar rápido entre projetos
- `Ctrl+r` com PSFzf para histórico filtrável

---

## 📚 Tutoriais de referência

Essas configs foram inspiradas/tiradas destes conteúdos:

1. **Neovim setup** – [vídeo](https://www.youtube.com/watch?v=fFHlfbKVi30)
   - [Versão em artigo](https://www.devas.life/effective-neovim-setup-for-web-development-towards-2024/)
2. **Dev workflow usando tmux e vim** – [vídeo](https://www.youtube.com/watch?v=sSOfr2MtRU8&list=PLxQA0uNgQDCICMRwlOzWAZBPL05XBC_br&index=10)
3. **Git workflow produtivo no terminal** – [vídeo](https://www.youtube.com/watch?v=qKpY7t5m35k&list=PLxQA0uNgQDCICMRwlOzWAZBPL05XBC_br&index=4)
   - [Post no blog](https://dev.to/craftzdog/a-productive-command-line-git-workflow-for-indie-app-developers-k7d)
4. **Fish shell workflow para coding** – [vídeo](https://www.youtube.com/watch?v=KKxhf50FIPI)
5. **PowerShell + Oh My Posh no Windows 11** – [vídeo](https://www.youtube.com/watch?v=5-aK2_WwrmM)

---

## 🚀 Como usar este repositório

1. **Clone o repo**

   ```bash
   git clone https://github.com/SEU-USUARIO/dotfiles-public.git
   cd dotfiles-public
   ```

2. **Faça backup** dos seus arquivos atuais de config antes de sobrescrever qualquer coisa.

3. **Copie/sincronize** apenas o que você realmente quer usar:

   - Neovim: copie ou faça symlink do diretório `nvim/` para `~/.config/nvim`
   - Fish: copie ou faça symlink para `~/.config/fish`
   - Tmux: copie `.tmux.conf` ou similar para `~`
   - Git: importe os `.gitconfig` ou partes que interessarem
   - PowerShell: importe o perfil ou partes dele para o seu `$PROFILE`

4. Abra o Neovim e deixe o LazyVim instalar os plugins automaticamente.

5. Ajuste o que for necessário para o seu ambiente (idioma, paths, ferramentas extras).

---

## 📝 Notas finais

Essas configs são feitas para o **meu** fluxo, em Linux/macOS com terminal moderno e Windows via PowerShell. Use como referência, copie pedaços e adapte ao seu estilo.

Se quiser, abra issues ou PRs no repositório com sugestões de melhorias.
