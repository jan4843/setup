defaults write com.panic.transmit SplitCollapsedIndex -int 0

defaults write com.panic.transmit ShowHiddenFiles -bool true

mkdir -p ~/Library/Application\ Support/Transmit
ln -sf ~/Library/Dropbox/Transmit/Connections.transmitstore ~/Library/Application\ Support/Transmit
ln -sf ~/Library/Dropbox/Transmit/Metadata ~/Library/Application\ Support/Transmit
