function adb --wraps='HOME="$XDG_DATA_HOME"/android /usr/bin/adb' --description 'alias adb=HOME="$XDG_DATA_HOME"/android /usr/bin/adb'
    HOME="$XDG_DATA_HOME"/android /usr/bin/adb $argv
end
