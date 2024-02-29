mkdir -p traces

# get the current time
now=$(date +"%y_%m_%d__%H:%M:%S")

# if a command line argument is given, use this as the session and path name, otherwise, use the current time
if [ -z "$1" ]
then
    session_name='session_'$now
else
    session_name=session_$1
fi

# start the tracing
ros2 trace -p traces -s $session_name
