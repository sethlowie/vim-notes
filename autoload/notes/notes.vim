func! notes#notes#echo()
  call notes#notes#open_window()
endfunc

func! notes#notes#open_window()
  let width = float2nr(&columns * g:fzf_preview_floating_window_rate)
  let height = float2nr(&lines * g:fzf_preview_floating_window_rate)
  let top = ((&lines - height) / 2) - 1
  let left = (&columns - width) / 2
  let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

  let top = '╭' . repeat('─', width - 2) . '╮'
  let mid = '│' . repeat(' ', width - 2) . '│'
  let bot = '╰' . repeat('─', width - 2) . '╯'
  let lines = [top] + repeat([mid], height - 2) + [bot]
  
  let s:b_buf = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(s:b_buf, 0, -1, v:true, lines)
  call nvim_open_win(s:b_buf, v:true, opts)
endfunc
