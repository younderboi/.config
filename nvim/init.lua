-- =========
-- # TODO
-- =========
-- [ ] Docstrings
-- [ ] Co-Pilot
-- [ ] LSP?


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- =========
-- # Options
-- =========

vim.opt.clipboard:append('unnamedplus')  -- System clipboard integration

vim.opt.fillchars = { eob = ' ' }        -- Disable ~ denoting empty lines

vim.opt.number = true                    -- Enable line numbers


-- ===================================
-- # Keymap
-- ===================================

vim.g.mapleader = ' '

--- ==================================
-- # Lazy neovim plugin manager setup
-- ===================================

require("lazy").setup({
  spec = {
    -- add your plugins here
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- Start lazy.nvim
require("lazy").setup({
  -- LSP Configuration & Plugins
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Optional: Mason for managing LSP servers
      --"williamboman/mason.nvim",
      --"williamboman/mason-lspconfig.nvim",
      -- Optional: LSP UI enhancements
      --"glepnir/lspsaga.nvim",
      --"jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
    },
    config = function()
      local lspconfig = require("lspconfig")

      -- Example: Setting up a language server
      lspconfig.pyright.setup({}) -- Python LSP

      -- Set up other language servers here
      -- lspconfig.gopls.setup({}) -- Go LSP
    end
  },

  -- Other plugins go here
})
