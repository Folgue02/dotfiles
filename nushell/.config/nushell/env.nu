# env.nu
#
# Installed by:
# version = "0.104.0"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.
use std/util "path add"

# Rust related
$env.CARGO_HOME = ("~/.cargo" | path expand)

path add ("~/.local/bin" | path expand)

# SDKMan java installation directory
path add ($env.HOME | path join ".sdkman/candidates/java/current/bin/")
path add ($env.HOME | path join ".local/share/gem/ruby/3.4.0/bin")

$env.path ++= [($env.CARGO_HOME | path join "bin") ("~/.spicetify" | path expand)]

