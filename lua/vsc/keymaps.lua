local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- remap leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- yank to system clipboard
keymap({"n", "v"}, "<leader>y", '"+y', opts)

-- paste from system clipboard
keymap({"n", "v"}, "<leader>p", '"+p', opts)

-- new line no insert
keymap("n", "<Enter>", "o<Esc>", opts)
-- keymap("n", "<S-CR>", "O<Esc>", opts)

-- select all
keymap({"n", "v"}, "<leader>a", "ggVG", opts)

-- better indent handling
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move text up and down
keymap("v", "J", ":m .+1<CR>==", opts)
keymap("v", "K", ":m .-2<CR>==", opts)

keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- paste preserves primal yanked piece
keymap("v", "p", '"_dP', opts)

-- removes highlighting after escaping vim search
keymap("n", "<Esc>", "<Esc>:noh<CR>", opts)

-- search ignore case
keymap("n", "<leader>f", "/\\c", opts)

-- vscode keymaps
keymap({"n", "v"}, "<leader>q", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
keymap({"n", "v"}, "<leader>t", "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>")
--keymap({"n", "v"}, "<leader>br", "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")
keymap({"n", "v"}, "<leader>g", "<cmd>lua require('vscode').action('workbench.action.gotoSymbol')<CR>")
keymap({"n", "v"}, "<leader>d", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>")
keymap({"n", "v"}, "<leader>z", "<cmd>lua require('vscode').action('workbench.action.toggleZenMode')<CR>")
keymap({"n", "v"}, "<leader>sp", "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")
keymap({"n", "v"}, "<leader>cn", "<cmd>lua require('vscode').action('notifications.clearAll')<CR>")
keymap({"n", "v"}, "<leader>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
keymap({"n", "v"}, "<leader>cp", "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")
--keymap({"n", "v"}, "<leader>pr", "<cmd>lua require('vscode').action('code-runner.run')<CR>")
keymap({"n", "v"}, "<leader>fd", "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")
keymap("n", "<leader>ml", "<cmd>lua require('vscode').action('workbench.action.moveEditorToRightGroup')<CR>")
keymap("n", "<leader>mh", "<cmd>lua require('vscode').action('workbench.action.moveEditorToLeftGroup')<CR>")

-- Switch to editor 1-9
for i = 1, 9 do
    keymap(
        {"n", "v"},
        string.format("<leader>%d", i),
        string.format("<cmd>lua require('vscode').action('workbench.action.openEditorAtIndex%d')<CR>", i),
        opts
    )
end

-- Switch to next/previous editor
keymap({"n", "v"}, "<leader>n", "<cmd>lua require('vscode').action('workbench.action.nextEditor')<CR>", opts)
keymap({"n", "v"}, "<leader>b", "<cmd>lua require('vscode').action('workbench.action.previousEditor')<CR>", opts)
