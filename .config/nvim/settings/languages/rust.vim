" ===========================
" Rust Language Settings
" ===========================

""
" Set cargo as default compiler for rust files and buffers
"
autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock,*.rs compiler cargo

