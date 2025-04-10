base_name="django-runserver"
venv="django-RAG"
host="192.168.0.37"
port="8000"
session_name="$base_name"

i=1
while tmux has-session -t $session_name 2>/dev/null; do
    session_name="${base_name}-${i}"
    ((i++))
done

tmux new-session -d -s $session_name

echo "[info] Created new tmux session with name: $session_name"

tmux send-keys -t $session_name "source /home/dongik/src/venv/${venv}/bin/activate" C-m

echo "[info] activate: $venv"

tmux send-keys -t $session_name "python /home/dongik/src/django-RAG/django/manage.py runserver ${host}:${port}" C-m

echo "[info] Run django server $host:$port"

echo "[info] To attach to a tmux session, Run 'tmux attach -t $session_name'"
echo "[info] To scroll, (ctrl + b) + ["
echo "[info] To detach, (ctrl + b) + d"
echo "[info] To kill session, Run 'tmux kill-session -t ${session_name}'"

echo "---------- show tmux list ----------"
tmux ls

# tmux attach -t $session_name