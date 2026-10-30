if &t_Co == 256
    let g:log_date_color = 28
    let g:log_time_color = 172
    let g:log_error_color = 203
    let g:log_func_color = 39
    let g:log_kword_color = 76
    let g:log_value_color = 208
    let g:log_boundry_color = 249
else
    let g:log_date_color = 10 "green
    let g:log_time_color = 3 "yellow
    let g:log_error_color = 9 "red
    let g:log_func_color = 6 "cyan
    let g:log_kword_color = 2 "green
    let g:log_value_color = 3 "yellow
    let g:log_boundry_color = 7 "grey
endif