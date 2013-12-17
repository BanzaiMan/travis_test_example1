#! /bin/bash -x


function ensure_port_unused {
  (
    lsof -i :$1
  ) &> /dev/null

  if [ $? -eq 0 ]; then
    echo $2
    return 1
  fi
  return 0
}

function ensure_port_unused_sudo {
  (
    lsof -i :$1
  ) &> /dev/null

  if [ $? -eq 0 ]; then
    echo $2
    return 1
  fi
  return 0
}

ensure_port_unused 4202

ensure_port_unused_sudo 4202
