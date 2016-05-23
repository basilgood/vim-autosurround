vim-tests:type "$_vim_session" 'iblah(somevar, x)' "escape"
vim-tests:type "$_vim_session" '^lllla' 'pig(' "escape"
vim-tests:type "$_vim_session" '$hi' ')' "escape"
#vim-tests:type "$_vim_session" ':mess' 'enter'

tests:eval tmux:cat-screen "$_vim_session"

vim-tests:write-file "$_vim_session" "result"

tests:assert-no-diff "result" <<EXPECTED
blah(pig(somevar, x))
EXPECTED
