#!/usr/bin/bash

T_PATH="/opt/ctcp_task/task"
task_list(){
  if [ -s $T_PATH ]; then
    printf "
=======================
 TASK ------- LIST    |
=======================
"
    cat $T_PATH
 else
    printf "Currently! you don't have a task!\n"
 fi
}

task_add(){
  printf 'Enter task: '
  read -r
  echo $REPLY >> $T_PATH
  printf '['$REPLY'] <- Task added successfully!\n'
}

help(){
  printf '
========================
 COMMANDS | example
========================
  list     | N/A
  add      | task list
  rem      | task rem <task_name>
  clear    | task clear
 '
}

remove(){
  if [[ -n $1 ]]; then
    sed -i "/$1/d" $T_PATH
    printf "$1 removed successfully!\n"
  fi
}

task_clear(){
  rm /opt/ctcp_task/task
  touch /opt/ctcp_task/task
  printf "Task list cleared!!\n"
}

if [[ $1 == 'list' ]]; then
  task_list
elif [[ $1 == 'add' ]]; then
  task_add
elif [[ $1 == 'rem' ]]; then
  remove $2
elif [[ $1 == 'help' ]]; then
  help
elif [[ $1 == 'clear' ]]; then
 task_clear
else
  printf '[Error] Invalid arguments! \nTry executing `task help` or use `help` as argument.\n'

fi
