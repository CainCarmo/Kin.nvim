return {
  "iamcco/markdown-preview.nvim",
  ft = "markdown",
  cmd = {
    "MarkdownPreview",
    "MarkdownPreviewStop",
    "MarkdownPreviewToggle"
  },
  keys = {
    { "<leader>Mo", "<cmd>MarkdownPreview<CR>",       desc = "Open preview",   mode = { "n", "v" } },
    { "<leader>Mc", "<cmd>MarkdownPreviewStop<CR>",   desc = "Close preview",  mode = { "n", "v" } },
    { "<leader>Mt", "<cmd>MarkdownPreviewToggle<CR>", desc = "Toggle preview", mode = { "n", "v" } }
  },
  build = "cd app && npm install",
  init = function()
    vim.g.mkdp_auto_start = 0
    vim.g.mkdp_filetypes  = { "markdown" }
  end
}