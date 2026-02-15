set BACKEND_PATH ~/dev/tenacy-app/backend

if test -d $BACKEND_PATH
    envsource $BACKEND_PATH/local.env
    set -gx ROOT_BACKEND_PROJECT $BACKEND_PATH/back
    set -gx FLASK_APP $BACKEND_PATH/back/src/run.py

    function tdb
        genv -C $ROOT_BACKEND_PROJECT/src poetry run flask db $argv
    end
    function tpt
        if ! docker info > /dev/null 2>&1;
            echo "Docker is not running"
            return 1
        end
        genv -C $ROOT_BACKEND_PROJECT/src poetry run pytest $argv
    end
    function tpo --wraps='poetry' --description 'Poetry in tenacy-app'
        genv -C $ROOT_BACKEND_PROJECT/src poetry $argv
    end
    abbr tpu tpt -m unit
    abbr tpi tpt -m '"(not unit)"'
end