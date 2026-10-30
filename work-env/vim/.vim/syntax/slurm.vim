syn match logTimeBoundries "^\[\.*\]\ze" contains=logDate,logTime
syn match logDate "\d\{4\}-\d\{2\}-\d\{2\}" nextgroup=logTime containedin=logTimeBoundries
syn match logTime "\d\{2\}:\d\{2\}:\d\{2\}+\d\{2\}:\d\{2\}" containedin=logTimeBoundries
syn match logError "error:" containedin=logFunc
syn match logFunc "] \zs\(error:\)\?\( \?\S\+\)*:"

if exists("g:log_date_color")
    execute "highlight logDate cterm=NONE ctermfg=" . g:log_date_color . "
    execute "highlight logTime cterm=NONE ctermfg=" . g:log_time_color . "
    execute "highlight logError cterm=NONE ctermfg=" . g:log_error_color . "
    execute "highlight logFunc cterm=NONE ctermfg=" . g:log_func_color . "
else
    echom "Slurm log colors not found, not setting colors"
endif