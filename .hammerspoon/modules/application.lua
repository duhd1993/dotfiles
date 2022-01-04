app_list = {
    {key = 'A', name = 'alacritty'},
    {key = 'E', name = 'Sublime Text'},
}

for _, app in ipairs(app_list) do
    hs.hotkey.bind('alt',app.key, function()
        hs.application.open(app.name)
    end)
end
