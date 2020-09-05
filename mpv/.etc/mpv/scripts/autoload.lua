MAXENTRIES = 30

function Set (t)
    local set = {}
    for _, v in pairs(t) do set[v] = true end
    return set
end

EXTENSIONS = Set {
    '3gp',
    'avi',
    'flac',
    'flv',
    'm4a',
    'm4v',
    'mkv',
    'mp3',
    'mp4',
    'mpeg',
    'mpg',
    'ogv',
    'ogv',
    'rmvb',
    'wav',
    'webm',
    'wma',
    'wmv',
}

mputils = require 'mp.utils'

function add_files_at(index, files)
    index = index - 1
    local oldcount = mp.get_property_number("playlist-count", 1)
    for i = 1, #files do
        mp.commandv("loadfile", files[i], "append")
        mp.commandv("playlist_move", oldcount + i - 1, index + i - 1)
    end
end

function get_extension(path)
    match = string.match(path, "%.([^%.]+)$" )
    if match == nil then
        return "nomatch"
    else
        return match
    end
end

table.filter = function(t, iter)
    for i = #t, 1, -1 do
        if not iter(t[i]) then
            table.remove(t, i)
        end
    end
end

function find_and_add_entries()
    local path = mp.get_property("path", "")
    local dir, filename = mputils.split_path(path)
    if #dir == 0 then
        return
    end

    local files = mputils.readdir(dir, "files")
    if files == nil then
        return
    end
    table.filter(files, function (v, k)
        local ext = get_extension(v)
        if ext == nil then
            return false
        end
        return EXTENSIONS[string.lower(ext)]
    end)
    table.sort(files, function (a, b)
        return string.lower(a) < string.lower(b)
    end)

    if dir == "." then
        dir = ""
    end

    local pl = mp.get_property_native("playlist", {})
    local pl_current = mp.get_property_number("playlist-pos", 0) + 1
    local current
    for i = 1, #files do
        if files[i] == filename then
            current = i
            break
        end
    end
    if current == nil then
        return
    end

    local append = {[-1] = {}, [1] = {}}
    for direction = -1, 1, 2 do
        for i = 1, MAXENTRIES do
            local file = files[current + i * direction]
            local pl_e = pl[pl_current + i * direction]
            if file == nil or file[1] == "." then
                break
            end

            local filepath = dir .. file
            if pl_e then
                if pl_e.filename == filepath then
                    break
                end
            end

            if direction == -1 then
                if pl_current == 1 then
                    mp.msg.info("Prepending " .. file)
                    table.insert(append[-1], 1, filepath)
                end
            else
                mp.msg.info("Adding " .. file)
                table.insert(append[1], filepath)
            end
        end
    end

    add_files_at(pl_current + 1, append[1])
    add_files_at(pl_current, append[-1])
end

mp.register_event("start-file", find_and_add_entries)
