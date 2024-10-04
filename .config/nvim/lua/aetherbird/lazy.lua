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

require("lazy").setup("plugin-init")

    require("lazy").setup({
      "folke/which-key.nvim",
      "folke/tokyonight.nvim",
      "theprimeagen/harpoon",
      "kepano/flexoki-neovim",
      "aetherbird/aetherwind",
      "mbbill/undotree",
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "freddiehaddad/feline.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-treesitter/playground",
      --  ** Plugins for LSP **
        --"VonHeikemen/lsp-zero.nvim",
        --"neovim/nvim-lspconfig",
        --"hrsh7th/cmp-nvim-lsp",
        --"hrsh7th/nvim-cmp",
        --"L3MON4D3/LuaSnip",
      "williamboman/mason.nvim"
    })
-- require("mason").setup()
-- require("lazy").setup(plugins, opts)
