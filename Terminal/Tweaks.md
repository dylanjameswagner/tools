# Filter History - Search with Up/Down Arrow
_in ~/.bash_profile_

    bind '"\e[A":history-search-backward'
    bind '"\e[B":history-search-forward'

# ??? Move Cursor A Word At A Time
_in ~/.bash_profile_

    bind '"\e\e[C": forward-word'
    bind '"\e\e[D": backward-word'

# Alias for Editing Common Files

    alias editbash='sudo nano ~/.bash_profile'

    alias edithosts='sudo nano /etc/hosts'
    alias editvhosts='sudo nano /etc/apache2/extra/httpd-vhosts.conf'

# Alias for Show/Hide Hidden Files

    alias showfiles='defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder /System/Library/CoreServices/Finder.app'

<!--break-->

    alias hidefiles='defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder /System/Library/CoreServices/Finder.app'

# Enable text selection in Quick Look

    defaults write com.apple.finder QLEnableTextSelection -bool true

# Enable text replacement globally

    defaults write -g WebAutomaticTextReplacementEnabled -bool true

# Show/Hide Hidden Files

    defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder /System/Library/CoreServices/Finder.app

# Disable warning when changing a file extension

    defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Enable/disable window shadows in screenshots
_or use OPTION when clicking_

    defaults write com.apple.screencapture disable-shadow -bool true; killall SystemUIServer

# ???

    .inputrc - home dir

By default, the Terminal has these shortcuts to move (left and right) word-by-word:
!this may be default now… seems to work
Esc + b (left)
Esc + f (right)
You can configure Alt + left and right to generate those sequences for you:

Open Terminal preferences (command + ,);
At Settings tab, select Keyboard and double-click ⌥ ← if it's there, or add it if it's not.
Set the modifier as desired, and type the shortcut key in the box: Esc+b, generating the text \033b (you can't type this text manually).
Repeat for word-right (esc+f becomes \033f)
