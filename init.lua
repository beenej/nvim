-- Set leader keys, notable before anything else below. 
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load basic config
require("config.options")
require("config.keymaps")
require("config.autocmds")

-----------------------------------------------------------
-- Bootstrap lazy.nvim
-----------------------------------------------------------

local uv = vim.uv or vim.loop

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-----------------------------------------------------------
-- Load plugins from lua/plugins/*.lua
-----------------------------------------------------------
require("lazy").setup("plugins", {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})

