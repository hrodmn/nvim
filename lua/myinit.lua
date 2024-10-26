-- Function to set filetype to 'sh' for .envrc files
local function set_envrc_filetype()
  -- Create the augroup for setting filetype
  local group_id = vim.api.nvim_create_augroup("filetype_envrc", { clear = true })
  -- Auto command for setting the filetype
  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = group_id,
    pattern = "*.envrc",
    command = "set filetype=sh",
  })
end

-- Call the function
set_envrc_filetype()
