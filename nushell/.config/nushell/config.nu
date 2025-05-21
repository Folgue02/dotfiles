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
source ./prompt.nu
source ./commands.nu

# ###############################################
# Startup
# ###############################################
neofetch
