defaults write com.codeweavers.CrossOver AutoLaunch -int 2

defaults delete com.codeweavers.CrossOver ProgramsFolderBookmark 2> /dev/null
defaults write com.codeweavers.CrossOver ProgramsFolderPath ~/.Trash
