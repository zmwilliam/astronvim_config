return function(config)
  -- Mapping data with "desc" stored directly by vim.keymap.set().
  --
  -- Please use this mappings table to set keyboard mapping since this is the
  -- lower level configuration and more robust one. (which-key will
  -- automatically pick-up stored data by this setting.)

  local utils = require "astronvim.utils"

  local normal_visual = {
    ["<leader>d"] = { [["+d]], desc = "delete to clipboard" },
    ["<leader>p"] = { [["+p]], desc = "paste from clipboard (after)" },
    ["<leader>P"] = { [["+P]], desc = "paste from clipboard (before)" },
    ["<leader>y"] = { [["+y]], desc = "yank to clipboard" },
  }

  local maps = {
    -- first key is the mode
    n = utils.extend_tbl(normal_visual, {
      -- Search will center on the line it's found in
      -- ["n"] = { "nzzzv" },
      -- ["N"] = { "Nzzzv" },

      -- Page up/down centering
      ["<C-d"] = { "<C-d>zz" },
      ["<C-u"] = { "<C-u>zz" },

      -- Keep cursor position
      ["J"] = { "mzJ`z" },

      ["<leader>D"] = { [["+d$]], desc = "delete to clipboard (d$)" },
      ["<leader>Y"] = { [["+y$]], desc = "yank to clipboard (y$)" },

      --Fugitive
      ["<leader>gg"] = { "<cmd>Git<cr>", desc = "Fugitive" },
      ["<leader>go"] = { "<cmd>GBrowse<cr>", desc = "Open file in host" },

      -- Override find buffers to sort by last used
      ["<leader>fb"] = {
        function() require("telescope.builtin").buffers { sort_lastused = true } end,
        desc = "Find buffers",
      },
    }),
    v = utils.extend_tbl(normal_visual, {
      -- Visual paste without yanking
      ["p"] = { '"_dP' },

      ["<leader>p"] = { [["+p]], desc = "paste from clipboard (after)" },

      -- Stay in indent mode
      ["<"] = { "<gv" },
      [">"] = { ">gv" },
    }),
  }

  local normal_replacements = {
    ["<leader>p"] = "<leader>m",
    ["<leader>pi"] = "<leader>mi",
    ["<leader>ps"] = "<leader>ms",
    ["<leader>pS"] = "<leader>mS",
    ["<leader>pu"] = "<leader>mu",
    ["<leader>pU"] = "<leader>mU",
    ["<leader>pa"] = "<leader>ma",
    ["<leader>pA"] = "<leader>mA",
    ["<leader>pv"] = "<leader>mv",
    ["<leader>pl"] = "<leader>ml",
    ["<leader>pm"] = "<leader>mm",
    ["<leader>pM"] = "<leader>mM",
  }

  for current, new in pairs(normal_replacements) do
    config.n[new] = config.n[current]
    config.n[current] = false
  end

  config = utils.extend_tbl(config, maps)
  return config
end
