local source = {}

function do_complete(before, after, callback)
    callback({
        { label = 'January' },
        { label = 'February' },
        { label = 'March' },
        { label = 'April' },
        { label = 'May' },
        { label = 'June' },
        { label = 'July' },
        { label = 'August' },
        { label = 'September' },
        { label = 'October' },
        { label = 'November' },
        { label = 'December' },
    })
end

function source:complete(params, callback)
    local cursor = params.context.cursor

    local lines_before = vim.api.nvim_buf_get_lines(0, math.max(0, cursor.line - 100), cursor.line, false)
    table.insert(lines_before, params.context.cursor_before_line)
    local before = table.concat(lines_before, '\n')

    local lines_after = vim.api.nvim_buf_get_lines(0, cursor.line + 1, math.max(0, cursor.line + 100), false)
    table.insert(lines_after, 1, params.context.cursor_after_line)
    local after = table.concat(lines_after, '\n')

    do_complete(before, after, callback)
end

return source

