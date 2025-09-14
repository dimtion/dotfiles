local map = vim.keymap.set

map("n", "<esc>", "<cmd>nohlsearch<cr>")

-- Disabled arrows keys to practice using other movements
-- Not as relevant today, but kept for history
map("n", "<Right>", "<Nop>")
map("n", "<Left>", "<Nop>")
-- map("n", "<Down>", "<Nop>")
-- map("n", "<Up>", "<Nop>")

-- Split and window movements
-- Quickly move between panes
map("n", "<c-h>", "<c-w><c-h>")
map("n", "<c-j>", "<c-w><c-j>")
map("n", "<c-k>", "<c-w><c-k>")
map("n", "<c-l>", "<c-w><c-l>")
map("n", "<c-t>", "<cmd>tabnew<cr>", { desc = "New tab" })
map("n", "<c-w>t", "<cmd>tabnew<cr>", { desc = "New tab" })

--
-- File & Buffer
--
map(
  "n",
  "<leader>fn",
  "<cmd>enew<cr>",
  { noremap = true, silent = true, desc = "New unnamed buffer" }
)
map(
  "n",
  "<leader>fw",
  "<cmd>w<cr>",
  { noremap = true, silent = true, desc = "Buffer write" }
)
map(
  "n",
  "<leader>fx",
  "<cmd>x<cr>",
  { noremap = true, silent = true, desc = "Buffer write and exit" }
)
map(
  "n",
  "<LocalLeader>fp",
  "<cmd>let @+=expand('%:p')<cr>",
  { desc = "Yank absolute buffer path to clipboard" }
)
map(
  "n",
  "<LocalLeader>fP",
  "<cmd>let @+=expand('%')<cr>",
  { desc = "Yank relative buffer path to clipboard" }
)

--
-- Yank / paste
--
map(
  "n",
  "<localleader>xp",
  "<cmd>set invpaste paste?<cr>",
  { desc = "Toggle paste mode" }
)
map(
  { "n", "v" },
  "<localleader>y",
  [["+y]],
  { desc = "Yank to system clipboard (selection)" }
)
map(
  "n",
  "<localleader>Y",
  [["+Y]],
  { desc = "Yank to system clipboard (linewise)" }
)

-- NOTE: Disabled as it does not work properly
-- map p in visual mode replace the selected text with the yank register
-- map("v", "p", [["_dP]], { noremap = true })

--
-- Search
--

-- When doing `*` search, highlight the word under the cursor without moving
-- TODO: does not work well for [^\w] chars
map("n", "*", function()
  vim.fn.setreg(
    "/",
    [[\V\<]] .. vim.fn.escape(vim.fn.expand "<cword>", [[/\]]) .. [[\>]]
  )
  vim.fn.histadd("/", vim.fn.getreg "/")
  vim.o.hlsearch = true
end)

--
-- Shortcuts & stored macros
--

-- Insert the current date
map("n", "<localleader>it", function()
  vim.api.nvim_put({ os.date "%Y-%m-%d %H:%M:%S" }, "c", true, true)
end, { noremap = true, silent = true, desc = "Insert current timestamp" })
