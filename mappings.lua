-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  v = {
    ["<leader>p"] = '"_dP',
    ["<leader>y"] = '"+y',

    ["J"] = ":m '>+1<CR><CR>gv=gv",
    ["K"] = ":m '<-2<CR><CR>gv=gv",
  },

  n = {
    ["<leader>gaj"] = { "<cmd>GoAddTag json<cr>", desc = "Add json to Go structure" },
    ["<leader>grj"] = { "<cmd>GoRmTag json<cr>", desc = "Remove json from Go structure" },

    ["<leader>r"] = { "<cmd>!go run .<cr>", desc = "Run main.go" },
    ["<leader>t"] = { "<cmd>!go test<cr>", desc = "Run testing" },
    ["<leader>i"] = { "<cmd>GoIfErr<cr>", desc = "If err" },
    ["<leader>bm"] = { "<cmd>!go test -bench=. -benchmem<cr>", desc = "Benchmark" },

    ["<leader>s"] = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",

    ["<leader>x"] = "<cmd>!chmod +x %<CR>",

    ["J"] = "mzJ`z",

    ["<C-d>"] = "<C-d>zz",
    ["<C-u>"] = "<C-u>zz",

    ["n"] = "nzzzv",
    ["N"] = "Nzzzv",

    ["<leader>y"] = '"+y',
    ["<leader>Y"] = '"+Y',

    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },

  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
