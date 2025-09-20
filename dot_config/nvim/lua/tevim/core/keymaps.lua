local opts = { noremap = true, silent = true }
local map = vim.keymap.set

map({ "n", "v", "i" }, "<C-a>", "<ESC>ggVG", { noremap = true, silent = true, desc = "Select All" })
map("v", "<C-c>", "y", { noremap = true, silent = true, desc = "Copy" })
map({ "n", "i" }, "<C-v>", "<ESC>pa", { noremap = true, silent = true, desc = "Paste" })
map({ "n", "v" }, "<C-x>", "d", { noremap = true, silent = true, desc = "Cut" })
map({ "n", "v", "i" }, "<C-z>", "<cmd>undo<CR>", { noremap = true, silent = true, desc = "Undo" })

map("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', 
    { expr = true, desc = "Move Cursor Down (Allow Wrapped)" })
map("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', 
    { expr = true, desc = "Move Cursor Up (Allow Wrapped)" })

map("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "Move Cursor Left Buffer" })
map("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "Move Cursor Down Buffer" })
map("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "Move Cursor Up Buffer" })
map("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Move Cursor Right Buffer" })

map({ "n", "i" }, "<C-s>", "<ESC><cmd>w<CR>", { noremap = true, silent = true, desc = "Save" })
map({ "n", "v" }, "<Leader>q", "<cmd>qa!<CR>", { noremap = true, silent = true, desc = "Quit" })

map({ "n", "i" }, "<M-Up>", "<Esc><cmd>m-2<CR>", { noremap = true, silent = true, desc = "Move Line Up (Insert)" })
map({ "n", "i" }, "<M-Down>", "<Esc><cmd>m+<CR>", { noremap = true, silent = true, desc = "Move Line Down (Insert)" })
map("x", "<M-Up>", ":move '<-2<CR>gv-gv", { noremap = true, silent = true, desc = "Move Line Up (Visual)" })
map("x", "<M-Down>", ":move '>+1<CR>gv-gv", { noremap = true, silent = true, desc = "Move Line Down (Visual)" })

map({ "n", "v" }, "<C-Up>", "<cmd>resize +2<CR>", { noremap = true, silent = true, desc = "Resize Window Up" })
map({ "n", "v" }, "<C-Down>", "<cmd>resize -2<CR>", { noremap = true, silent = true, desc = "Resize Window Down" })
map({ "n", "v" }, "<C-Left>", "<cmd>vertical resize +2<CR>", { noremap = true, silent = true, desc = "Resize Window Left" })
map({ "n", "v" }, "<C-Right>", "<cmd>vertical resize -2<CR>", { noremap = true, silent = true, desc = "Resize Window Right" })

map("i", "<C-j>", "<Down>", { noremap = true, silent = true, desc = "Move Cursor Down in Insert Mode" })
map("i", "<C-k>", "<Up>", { noremap = true, silent = true, desc = "Move Cursor Up in Insert Mode" })
map("i", "<C-h>", "<Left>", { noremap = true, silent = true, desc = "Move Cursor Left in Insert Mode" })
map("i", "<C-l>", "<Right>", { noremap = true, silent = true, desc = "Move Cursor Right in Insert Mode" })

map("n", "<Enter>", "<cmd>nohlsearch<CR>", { noremap = true, silent = true, desc = "Clear Highlight" })

-- Lazy
map({ "n", "v" }, "<Leader>pC", "<cmd>Lazy clean<CR>", { noremap = true, silent = true, desc = "Lazy Clean" })
map({ "n", "v" }, "<Leader>pc", "<cmd>Lazy log<CR>", { noremap = true, silent = true, desc = "Lazy Log" })
map({ "n", "v" }, "<Leader>pi", "<cmd>Lazy install<CR>", { noremap = true, silent = true, desc = "Lazy Install" })
map({ "n", "v" }, "<Leader>ps", "<cmd>Lazy sync<CR>", { noremap = true, silent = true, desc = "Lazy Sync" })
map({ "n", "v" }, "<Leader>pS", "<cmd>Lazy show<CR>", { noremap = true, silent = true, desc = "Lazy Status" })
map({ "n", "v" }, "<Leader>pu", "<cmd>Lazy update<CR>", { noremap = true, silent = true, desc = "Lazy Update" })

-- Options
map({ "n", "v" }, "<Leader>oa", "<cmd>Ranger<CR>", { noremap = true, silent = true, desc = "Ranger" })
-- map({"n", "v"}, "<Leader>og", )
map({ "n", "v" }, "<Leader>ow", "<cmd>lua require('tevim.core.utils').toggle_option('wrap')<CR>", 
    { noremap = true, silent = true, desc = "Toggle Wrap" })
map({ "n", "v" }, "<Leader>os", "<cmd>lua require('tevim.core.utils').toggle_option('spell')<CR>", 
    { noremap = true, silent = true, desc = "Toggle Spell" })
map({ "n", "v" }, "<Leader>on", "<cmd>lua require('tevim.core.utils').toggle_option('number')<CR>", 
    { noremap = true, silent = true, desc = "Toggle Number" })
map({ "n", "v" }, "<Leader>or", "<cmd>lua require('tevim.core.utils').toggle_option('relativenumber')<CR>", 
    { noremap = true, silent = true, desc = "Toggle Relative Number" })

-- Windows
map({ "n", "v" }, "<Leader>wv", "<C-w>v", { noremap = true, silent = true, desc = "Vertical Split" })
map({ "n", "v" }, "<Leader>wh", "<C-w>s", { noremap = true, silent = true, desc = "Horizontal Split" })
map({ "n", "v" }, "<Leader>we", "<C-w>=", { noremap = true, silent = true, desc = "Make Splits Equal" })
map({ "n", "v" }, "<Leader>wq", "<cmd>close<CR>", { noremap = true, silent = true, desc = "Close Split" })

-- Telescope
map({ "n", "v" }, "<Leader>ff", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true, desc = "Find File" })
map({ "n", "v" }, "<Leader>fr", "<cmd>Telescope oldfiles<CR>", { noremap = true, silent = true, desc = "Recent File" })
map({ "n", "v" }, "<Leader>fw", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true, desc = "Find Text" })
map({ "n", "v" }, "<Leader>fm", "<cmd>Telescope keymaps<CR>", { noremap = true, silent = true, desc = "Keymaps" })
map({ "n", "v" }, "<Leader>fM", "<cmd>Telescope man_pages<CR>", { noremap = true, silent = true, desc = "Man Pages" })
map({ "n", "v" }, "<Leader>fR", "<cmd>Telescope registers<CR>", { noremap = true, silent = true, desc = "Registers" })
map({ "n", "v" }, "<Leader>fj", "<cmd>Telescope commands<CR>", { noremap = true, silent = true, desc = "Commands" })
map({ "n", "v" }, "<Leader>fh", "<cmd>Telescope highlights<CR>", { noremap = true, silent = true, desc = "Highlights" })
map({ "n", "v" }, "<Leader>ft", "<cmd>TodoTelescope<CR>", { noremap = true, silent = true, desc = "Todos" })

-- Git
map({ "n", "v" }, "<Leader>gl", "<cmd>LazyGit<CR>", { noremap = true, silent = true, desc = "Lazygit" })
map({ "n", "v" }, "<Leader>go", "<cmd>Telescope git_status<CR>", { noremap = true, silent = true, desc = "Open Changed File" })
map({ "n", "v" }, "<Leader>gc", "<cmd>Telescope git_branches<CR>", { noremap = true, silent = true, desc = "Checkout Branch" })
map({ "n", "v" }, "<Leader>gm", "<cmd>Telescope git_commits<CR>", { noremap = true, silent = true, desc = "Checkout Commit" })
map({ "n", "v" }, "<Leader>gj", "<cmd>Gitsigns next_hunk<CR>", { noremap = true, silent = true, desc = "Next Hunk" })
map({ "n", "v" }, "<Leader>gk", "<cmd>Gitsigns prev_hunk<CR>", { noremap = true, silent = true, desc = "Prev Hunk" })
map({ "n", "v" }, "<Leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { noremap = true, silent = true, desc = "Reset Hunk" })
map({ "n", "v" }, "<Leader>gp", "<cmd>Gitsigns preview_hunk<CR>", { noremap = true, silent = true, desc = "Preview Hunk" })
map({ "n", "v" }, "<Leader>gR", "<cmd>Gitsigns reset_buffer<CR>", { noremap = true, silent = true, desc = "Reset Buffer" })
map({ "n", "v" }, "<Leader>gs", "<cmd>Gitsigns stage_hunk<CR>", { noremap = true, silent = true, desc = "Stage Hunk" })
map({ "n", "v" }, "<Leader>gS", "<cmd>Gitsigns undo_stage_hunk<CR>", { noremap = true, silent = true, desc = "Undo Stage Hunk" })
map({ "n", "v" }, "<Leader>gb", "<cmd>Gitsigns blame_line<CR>", { noremap = true, silent = true, desc = "Blame Line" })
map({ "n", "v" }, "<Leader>gd", "<cmd>Gitsigns diffthis HEAD<CR>", { noremap = true, silent = true, desc = "Diff" })

-- LSP
map({ "n", "v" }, "<Leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true, desc = "Code Action" })
map({ "n", "v" }, "<Leader>li", "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>", 
    { noremap = true, silent = true, desc = "Toggle InlayHints" })
map({ "n", "v" }, "<Leader>lI", "<cmd>LspInfo<CR>", { noremap = true, silent = true, desc = "Info" })
map({ "n", "v" }, "<Leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>", { noremap = true, silent = true, desc = "Next Diagnostic" })
map({ "n", "v" }, "<Leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<CR>", { noremap = true, silent = true, desc = "Prev Diagnostic" })
map({ "n", "v" }, "<Leader>lo", "<cmd>Lspsaga outline<CR>", { noremap = true, silent = true, desc = "Outline" })
map({ "n", "v" }, "<Leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true, desc = "Rename" })
map({ "n", "v" }, "<Leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", { noremap = true, silent = true, desc = "Document Symbols" })
map({ "n", "v" }, "<Leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", { noremap = true, silent = true, desc = "Workspace Symbols" })

-- Treesitter
map({ "n", "v" }, "<Leader>si", "<cmd>TSInstallInfo<CR>", { noremap = true, silent = true, desc = "Treesitter Info" })
map({ "n", "v" }, "<Leader>su", "<cmd>TSUpdate<CR>", { noremap = true, silent = true, desc = "Treesitter Update" })

-- Terminal
map({ "n", "v" }, "<Leader>t1", "<cmd>1ToggleTerm<CR>", { noremap = true, silent = true, desc = "Terminal 1" })
map({ "n", "v" }, "<Leader>t2", "<cmd>2ToggleTerm<CR>", { noremap = true, silent = true, desc = "Terminal 2" })
map({ "n", "v" }, "<Leader>t3", "<cmd>3ToggleTerm<CR>", { noremap = true, silent = true, desc = "Terminal 3" })
map({ "n", "v" }, "<Leader>t4", "<cmd>4ToggleTerm<CR>", { noremap = true, silent = true, desc = "Terminal 4" })
map({ "n", "v" }, "<Leader>tf", "<cmd>ToggleTerm direction=float<CR>", { noremap = true, silent = true, desc = "Float Terminal" })
map({ "n", "v" }, "<Leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<CR>", 
    { noremap = true, silent = true, desc = "Horizontal Terminal" })
map({ "n", "v" }, "<Leader>tv", "<cmd>ToggleTerm size=50 direction=vertical<CR>", { noremap = true, silent = true, desc = "Vertical Terminal" })

-- TeVim
map({ "n", "v" }, "<Leader><Leader>u", "<cmd>TeVimUpdate<CR>", { noremap = true, silent = true, desc = "Update TeVim" })
map({ "n", "v" }, "<Leader><Leader>m", "<cmd>TeVimCheckMason<CR>", { noremap = true, silent = true, desc = "Check Mason" })
map({ "n", "v" }, "<Leader><Leader>t", "<cmd>TeVimToggleTrans<CR>", { noremap = true, silent = true, desc = "Toggle Transparency" })
map({ "n", "v" }, "<Leader><Leader>c", "<cmd>TeVimThemes<CR>", { noremap = true, silent = true, desc = "TeVim Themes" })

-- Harpoon
map({ "n", "v" }, "<Leader>ha", function() 
    local harpoon = require("harpoon")
    harpoon:list():add() 
end, { noremap = true, silent = true, desc = "Harpoon Add File" })

map({ "n", "v" }, "<Leader>he", function() 
    local harpoon = require("harpoon")
    local conf = require("telescope.config").values
    
    local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
            table.insert(file_paths, item.value)
        end

        require("telescope.pickers").new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
                results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
        }):find()
    end
    
    toggle_telescope(harpoon:list())
end, { noremap = true, silent = true, desc = "Harpoon Menu (Telescope)" })

map({ "n", "v" }, "<Leader>h1", function() 
    require("harpoon"):list():select(1) 
end, { noremap = true, silent = true, desc = "Harpoon File 1" })

map({ "n", "v" }, "<Leader>h2", function() 
    require("harpoon"):list():select(2) 
end, { noremap = true, silent = true, desc = "Harpoon File 2" })

map({ "n", "v" }, "<Leader>h3", function() 
    require("harpoon"):list():select(3) 
end, { noremap = true, silent = true, desc = "Harpoon File 3" })

map({ "n", "v" }, "<Leader>h4", function() 
    require("harpoon"):list():select(4) 
end, { noremap = true, silent = true, desc = "Harpoon File 4" })

map({ "n", "v" }, "<Leader>hp", function() 
    require("harpoon"):list():prev() 
end, { noremap = true, silent = true, desc = "Harpoon Previous" })

map({ "n", "v" }, "<Leader>hn", function() 
    require("harpoon"):list():next() 
end, { noremap = true, silent = true, desc = "Harpoon Next" })

-- LeetCode
map({ "n", "v" }, "<Leader>Lm", "<cmd>Leet<CR>", { noremap = true, silent = true, desc = "LeetCode Menu" })
map({ "n", "v" }, "<Leader>Ll", "<cmd>Leet list<CR>", { noremap = true, silent = true, desc = "LeetCode List Problems" })
map({ "n", "v" }, "<Leader>Lr", "<cmd>Leet run<CR>", { noremap = true, silent = true, desc = "LeetCode Run" })
map({ "n", "v" }, "<Leader>LR", "<cmd>Leet random<CR>", { noremap = true, silent = true, desc = "LeetCode Random Problem" })
map({ "n", "v" }, "<Leader>Ld", "<cmd>Leet daily<CR>", { noremap = true, silent = true, desc = "LeetCode Daily Problem" })
map({ "n", "v" }, "<Leader>LD", "<cmd>Leet desc toggle<CR>", { noremap = true, silent = true, desc = "LeetCode Toggle Description" })
map({ "n", "v" }, "<Leader>Lt", "<cmd>Leet test<CR>", { noremap = true, silent = true, desc = "LeetCode Test" })
map({ "n", "v" }, "<Leader>Ls", "<cmd>Leet submit<CR>", { noremap = true, silent = true, desc = "LeetCode Submit" })
map({ "n", "v" }, "<Leader>Lc", "<cmd>Leet console toggle<CR>", { noremap = true, silent = true, desc = "LeetCode Console Toggle" })
map({ "n", "v" }, "<Leader>Li", "<cmd>Leet info<CR>", { noremap = true, silent = true, desc = "LeetCode Problem Info" })
map({ "n", "v" }, "<Leader>Lg", "<cmd>Leet lang<CR>", { noremap = true, silent = true, desc = "LeetCode Change Language" })
map({ "n", "v" }, "<Leader>Ly", "<cmd>Leet yank<CR>", { noremap = true, silent = true, desc = "LeetCode Yank Solution" })
map({ "n", "v" }, "<Leader>LC", "<cmd>Leet cache<CR>", { noremap = true, silent = true, desc = "LeetCode Update Cache" })

-- Render Markdown
map({ "n", "v" }, "<Leader>mr", "<cmd>RenderMarkdown toggle<CR>", { noremap = true, silent = true, desc = "Toggle Render Markdown" })
map({ "n", "v" }, "<Leader>me", "<cmd>RenderMarkdown enable<CR>", { noremap = true, silent = true, desc = "Enable Render Markdown" })
map({ "n", "v" }, "<Leader>md", "<cmd>RenderMarkdown disable<CR>", { noremap = true, silent = true, desc = "Disable Render Markdown" })
