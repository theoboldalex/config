-- Licence key is optional: without the file, intelephense runs its free features.
local get_intelephense_license_key = function()
    local f = io.open(os.getenv("HOME") .. "/intelephense/license.txt", "rb")
    if not f then return nil end
    local content = f:read("*a")
    f:close()
    return (string.gsub(content, "%s+", ""))
end

return {
    init_options = { licenceKey = get_intelephense_license_key() },
}
