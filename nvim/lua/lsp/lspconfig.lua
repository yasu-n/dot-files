-- lspconfig.lua

-- log
vim.lsp.set_log_level("off")

-- on_attach function
local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    local opts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set("n", "<space>h", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<space>d", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<space>i", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<space>f", function()
        vim.lsp.buf.format { async = true }
    end, opts)
    vim.keymap.set("n", "<space>gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<space>r", vim.lsp.buf.rename, opts)
    -- vim.keymap.set("n", "<space>gs", vim.lsp.buf.document_symbol, opts)
    vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<space>]", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<space>[", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

    if client.server_capabilities.documentHighlightProvider then
        vim.cmd [[
          set updatetime=500
          hi! LspReferenceText ctermbg=DarkGray guibg=LightGray
          hi! LspReferenceRead ctermbg=DarkGray guibg=LightGray
          hi! LspReferenceWrite ctermbg=DarkGray guibg=LightGray
        ]]
        vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
        vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
        vim.api.nvim_create_autocmd("CursorHold", {
            callback = vim.lsp.buf.document_highlight,
            buffer = bufnr,
            group = "lsp_document_highlight",
            desc = "Document Highlight",
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            callback = vim.lsp.buf.clear_references,
            buffer = bufnr,
            group = "lsp_document_highlight",
            desc = "Clear All the Refereneces",
        })
    end

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
    )
end

-- telescope
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<space>gs", telescope.lsp_document_symbols)
vim.keymap.set("n", "<space>gS", telescope.lsp_workspace_symbols)

-- capabilities
capabilities = require("cmp_nvim_lsp").default_capabilities()

-- completion
local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "vsnip" },
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-j>"] = cmp.mapping.scroll_docs(4),
        ["<C-k>"] = cmp.mapping.scroll_docs(-4),
        ["<CR>"] = cmp.mapping.confirm {
            befavior = cmp.ConfirmBehavior.Replace,
            select = true
        },
    }),
    experimental = {
        ghost_text = true,
    }
})

-- rust-analyzer
require("lspconfig")["rust_analyzer"].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    settings = {
        ["rust-analyzer"] = {}
    }
}

-- clangd
require("lspconfig")["clangd"].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    settings = {
        ["clangd"] = {}
    }
}

-- denols
require("lspconfig")["denols"].setup {
    root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc", "denops"),
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    settings = {
        ["denols"] = {}
    }
}

-- zig
require("lspconfig")["zls"].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    settings = {
        ["zls"] = {}
    }
}
