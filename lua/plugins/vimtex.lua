return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    -- should install w/ "sudo pacman -S zathura zathura-mupdf-pdf"
    vim.g.vimtex_view_method = "zathura"
    -- enables braces autocomplete 
    vim.g.vimtex_complete_close_braces = 1
  end
}
