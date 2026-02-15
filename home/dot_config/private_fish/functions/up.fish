function up
    set -l current_dir (dirname (pwd))
    while test ! -d "$current_dir/.git"
        set current_dir (dirname "$current_dir")
        if test "$current_dir" = "/"
            echo "No git repository found in parent directories."
            return 1
        end
    end
    cd $current_dir
end