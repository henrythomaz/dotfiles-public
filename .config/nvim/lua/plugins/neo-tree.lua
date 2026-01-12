return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },

      -- 🔥 ISSO AQUI É A CHAVE
      enable_simple_view = true,

      window = {
        position = "left",
        width = 30,
      },
    },

    -- garante que NÃO abre outras views
    sources = { "filesystem" },
  },
}
