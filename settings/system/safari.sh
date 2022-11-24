defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

sqlite3 ~/Library/Safari/PerSitePreferences.db "INSERT OR REPLACE INTO default_preferences (preference, default_value) values ('PerSitePreferencesCamera', '1');"
sqlite3 ~/Library/Safari/PerSitePreferences.db "INSERT OR REPLACE INTO default_preferences (preference, default_value) values ('PerSitePreferencesMicrophone', '1');"
sqlite3 ~/Library/Safari/PerSitePreferences.db "INSERT OR REPLACE INTO default_preferences (preference, default_value) values ('PerSitePreferencesStoreKeyScreenCapture', '1');"
sqlite3 ~/Library/Safari/PerSitePreferences.db "INSERT OR REPLACE INTO default_preferences (preference, default_value) values ('PerSitePreferencesGeolocation', '1');"
sqlite3 ~/Library/Safari/PerSitePreferences.db "INSERT OR REPLACE INTO default_preferences (preference, default_value) values ('PerSitePreferencesDownloads', '0');"
defaults write com.apple.Safari CanPromptForPushNotifications -bool false

defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari WebKitPreferences.developerExtrasEnabled -bool true
defaults write com.apple.Safari.SandboxBroker ShowDevelopMenu -bool true

defaults write com.apple.Safari ShowOverlayStatusBar -bool true

defaults write com.apple.Safari AllowJavaScriptFromAppleEvents -bool true

defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari.plist WBSTranslationHideMessageInUnifiedFieldSettingsKey -bool true
