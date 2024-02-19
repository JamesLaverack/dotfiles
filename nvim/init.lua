-- Initialise lazy.nvim for package management
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

-- Load and configure neovim plugins
require("lazy").setup({
	{
		-- Neovim Theme
		"Mofiqul/dracula.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd [[colorscheme dracula]]
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				-- Use the dracula theme for lualine
				theme = 'dracula',
			}
		},
	},
	{
		"folke/which-key.nvim",
		lazy = false,
	},
	{
		"neovim/nvim-lspconfig",
	},
	{
		"hrsh7th/nvim-cmp",
	},
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"hrsh7th/cmp-nvim-lsp-signature-help",
	},
	{
		"hrsh7th/cmp-path",
	},
	{
		"hrsh7th/cmp-buffer",
	},
	{
		"L3MON4D3/LuaSnip",
	},
	{
		"voldikss/vim-floaterm",
	},
	{
		"ahmedkhalf/project.nvim",
	},
	{
		"nvim-tree/nvim-tree.lua",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
	},
})

-- Line Numers
vim.wo.number = true

-- Suggested LSP configuration, from neovim/nvim-lspconfig

-- Mappings.

local function desc(o, d)
	return vim.tbl_extend("force", o, { desc = d })
end

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, desc(opts, "Open diagnostic float"))
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, desc(opts, "Go to previous diagnostic"))
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, desc(opts, "Go to next diagnostic"))
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, desc(opts, "Set diagnostic loc list"))

-- Pretend like I'm good at Vim
vim.keymap.set({ '' }, '<up>', '<nop>')
vim.keymap.set({ '' }, '<down>', '<nop>')
vim.keymap.set({ '' }, '<left>', '<nop>')
vim.keymap.set({ '' }, '<right>', '<nop>')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, desc(bufopts, "Go to declaration"))
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, desc(bufopts, "Go to defintioin"))
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, desc(bufopts, "Hover"))
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, desc(bufopts, "Go to implementation"))
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, desc(bufopts, "Signature help"))
	vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, desc(bufopts, "Add workspace folder"))
	vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, desc(bufopts, "Remove workspace folder"))
	vim.keymap.set('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, desc(bufopts, "List workspace folters"))
	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, desc(bufopts, "Type definition"))
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, desc(bufopts, "Rename"))
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, desc(bufopts, "Code action"))
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, desc(bufopts, "References"))
	vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, desc(bufopts, "Format file"))
end

require('luasnip').setup {}

-- cmp does completion, sourcing completing suggestions from the LSP.
local cmp = require('cmp')
cmp.setup {
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	sources = {
		{ name = 'path' },
		{ name = 'nvim_lsp',               keyword_length = 3 },
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'nvim_lua',               keyword_length = 2 },
		--    { name = 'buffer', keyword_length = 2 },
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<Tab>'] = cmp.mapping.select_next_item(),
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
}
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- LSPs
require('lspconfig').lua_ls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
		},
	},
}
require('lspconfig').rust_analyzer.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			diagnostics = {
				disabled = { "unresolved-import" },
			},
		},
	},
}
require('lspconfig').gopls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}

-- Floaterm
vim.keymap.set('n', '<leader>ft', ':FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 zsh <CR> ',
	desc(opts, "New Floaterm"))
vim.keymap.set('n', 't', ':FloatermToggle myfloat<CR>', desc(opts, "Open Floaterm Window"))
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>:q<CR>', desc(opts, "Close Floaterm Window"))

-- Project stuff
require('nvim-tree').setup {
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true
	},
}
require('project_nvim').setup {}

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
