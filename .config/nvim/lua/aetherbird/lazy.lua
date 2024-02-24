local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "folke/which-key.nvim",
  "folke/tokyonight.nvim",
  "theprimeagen/harpoon",
  "catppuccin/nvim",
  "kepano/flexoki-neovim",
  "aetherbird/aetherwind",
  "mbbill/undotree",
  "nvim-telescope/telescope.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-treesitter/nvim-treesitter",
  "nvim-treesitter/playground",
  "freddiehaddad/feline.nvim",
  --  ** Plugins for LSP **
  --  "VonHeikemen/lsp-zero.nvim",
  --  "neovim/nvim-lspconfig",
  --  "hrsh7th/cmp-nvim-lsp",
  --  "hrsh7th/nvim-cmp",
  --  "L3MON4D3/LuaSnip",
})

require("lazy").setup(plugins, opts)
