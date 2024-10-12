return {
  "echasnovski/mini.pairs",
  opts = {
    markdown = true,
    skip_ts = { "string" },
    skip_unbalanced = true,
    skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
    modes = { insert = true, command = true, terminal = false },
  },
  event = "InsertEnter"
}