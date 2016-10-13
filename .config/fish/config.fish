# Path to Oh My Fish install.
set -gx OMF_PATH "/Users/eelke/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/Users/eelke/.config/omf"

# Path to z 
set -gx Z_SCRIPT_PATH /usr/local/etc/profile.d/z.sh

function pjson
  python -m json.tool $argv | pygmentize -l json
end

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

