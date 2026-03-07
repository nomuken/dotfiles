return {
    { 'sheerun/vim-polyglot' },
    {
        'kaicataldo/material.vim',
        priority = 1000,
        config = function()
            vim.g.material_theme_style = 'ocean'
            vim.cmd.colorscheme('material')
        end,
    },
    { 'tpope/vim-surround', event = 'InsertEnter' },
    { 'airblade/vim-gitgutter' },
    { 'earthly/earthly.vim' },
    { 'github/copilot.vim' },
}
