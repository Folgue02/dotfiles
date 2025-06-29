# ###############################################
# General configuration
# ###############################################
$env.config.buffer_editor = "zeditor"
$env.config.show_banner = false

# ###############################################
# Configuration is splitted into multiple files
# ###############################################

# Environment variables
source ./env.nu
source ./commands.nu

# Prompt configuration (if starship exists, use it)
if (which starship | is-empty) {
	source ./starship.nu
} else {
	source ./prompt.nu
}


# ###############################################
# Aliases
# ###############################################
alias yay = paru
alias gti = git

# Git aliases
alias ga = git add
alias gc = git commit
alias gck = git checkout
alias gb = git branch
alias gd = git diff
alias gm = git merge
alias gp = git push
alias gpl = git pull

# ###############################################
# Startup
# ###############################################
