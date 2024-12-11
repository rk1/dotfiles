return {
  'neoclide/coc.nvim',
  branch = 'release',
  config = function()
    vim.g.coc_global_extensions = {
        'coc-tsserver',
        'coc-eslint',
        'coc-snippets',
        'coc-prettier',
    }

    -- GoTo code navigation
    vim.keymap.set('n', 'gd', '<Plug>(coc-definition)')
    vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)')
    vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)')
;   vim.keymap.set('n', 'gr', '<Plug>(coc-references)')

    -- Diagnostics navigation
    vim.keymap.set('n', '<C-k>', '<Plug>(coc-diagnostic-prev)')
    vim.keymap.set('n', '<C-j>', '<Plug>(coc-diagnostic-next)')

    -- Formatting and code actions
    vim.keymap.set({'n', 'x'}, '<leader>f', '<Plug>(coc-format-selected)')
    vim.keymap.set({'n', 'x'}, '<leader>a', '<Plug>(coc-codeaction-selected)')
    vim.keymap.set('n', '<leader>ac', '<Plug>(coc-codeaction)')
    vim.keymap.set('n', '<leader>qf', ':CocFix<CR>')

    -- Rename
    vim.keymap.set('n', '<leader>rn', '<Plug>(coc-rename)')

    -- Show documentation
    vim.keymap.set('n', 'K', function()
        if vim.tbl_contains({'vim', 'help'}, vim.bo.filetype) then
            vim.cmd('help ' .. vim.fn.expand('<cword>'))
        else
            vim.fn['CocAction']('doHover')
        end
    end)

    -- CR to confirm completion
    vim.keymap.set('i', '<CR>', function()
        if vim.fn.pumvisible() == 1 then
            return '<C-y>'
        else
            return '<C-g>u<CR>'
        end
    end, { expr = true, replace_keycodes = true })

    -- Tab completion and snippet expansion
    vim.keymap.set('i', '<TAB>', function()
        local function check_back_space()
            local col = vim.fn.col('.') - 1
            return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
        end

        if vim.fn['coc#pum#visible']() == 1 then
            return vim.fn['coc#_select_confirm']()
        elseif vim.fn['coc#expandableOrJumpable']() == 1 then
            return vim.fn['coc#rpc#request']('doKeymap', {'snippets-expand-jump', ''})
        elseif check_back_space() then
            return '<TAB>'
        else
            return vim.fn['coc#refresh']()
        end
    end, { expr = true, replace_keycodes = false })
  end
}
