```bash
k run strigus --image nginx --port 80

# attach to the container pod process
# the changes made inside the session are not persisted due the nature of the container layer fs
k attach my-pod -c my-pod -it

# start a proc inside the container
k exec -it my-pod -- bash
cat /etc/proc/1
```