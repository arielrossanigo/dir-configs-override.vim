let b:pattern = "%:p:h"
let b:search_path = expand(b:pattern)
while !filereadable(b:search_path . "/.vim.custom") && b:search_path != "/"
    let b:pattern = b:pattern . ":h"
    let b:search_path = expand(b:pattern)
endwhile

if filereadable(b:search_path . "/.vim.custom")
    exec ":source " . b:search_path . "/.vim.custom"
endif
