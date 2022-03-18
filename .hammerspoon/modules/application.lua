app_list = {
    {key = 'A', name = 'alacritty'},
    {key = 'E', name = 'Sublime Text'},
    {key = 'G', name = 'Marta'},
    {key = 'T', name = 'Telegram'}
}

for _, app in ipairs(app_list) do
    hs.hotkey.bind('alt',app.key, function()
        hs.application.open(app.name)
    end)
end
