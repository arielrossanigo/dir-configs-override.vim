let b:pattern = "%:p:h"
let b:search_path = expand(b:pattern)
let custom_configs_files = []

while b:search_path != "/"
    if filereadable(b:search_path . "/.vim.custom")
        call add(custom_configs_files, b:search_path . "/.vim.custom")
    endif
    let b:pattern = b:pattern . ":h"
    let b:search_path = expand(b:pattern)
endwhile

if len(custom_configs_files) != 0
    call reverse(custom_configs_files)
    for config_file in custom_configs_files
        exec ":source " . config_file
    endfor
else
    if filereadable(expand("~/.vim.custom"))
        exec ":source " . expand("~/.vim.custom")
    endif
endif
