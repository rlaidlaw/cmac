#!/bin/bash

FileMgrPid=${OODT_RUN}/filemgr.pid
ResourcePid=${OODT_RUN}/resource.pid
WorkflowPid=${OODT_RUN}/workflow.pid

function start {
  if [ ! -f $FileMgrPid ]; then
    exec ${FILEMGR_HOME}/bin/${FILEMGR_EXEC} start &
  fi
  if [ ! -f $WorkflowPid ]; then
    exec ${WORKFLOW_HOME}/bin/${WORKFLOW_EXEC} start &
  fi
  if [ ! -f $ResourcePid ]; then
    exec ${RESOURCE_HOME}/bin/${RESOURCE_EXEC} start &
  fi
  sleep 1
  echo ""
}

function stop {
  if [ -f $ResourcePid ]; then
    exec ${RESOURCE_HOME}/bin/${RESOURCE_EXEC} stop &
  fi
  if [ -f $WorkflowPid ]; then
    exec ${WORKFLOW_HOME}/bin/${WORKFLOW_EXEC} stop &
  fi
  if [ -f $FileMgrPid ]; then
    exec ${FILEMGR_HOME}/bin/${FILEMGR_EXEC} stop &
  fi
  sleep 1
  echo ""
}

function restart {
  stop
  echo "Waiting a few seconds before restarting..."
  echo ""
  sleep 5
  start
}

function status {
  exec ${FILEMGR_HOME}/bin/${FILEMGR_EXEC} status &
  exec ${WORKFLOW_HOME}/bin/${WORKFLOW_EXEC} status &
  exec ${RESOURCE_HOME}/bin/${RESOURCE_EXEC} status &
  sleep 1
  echo ""
}

function usage {
  echo ""
  echo "Usage: $0 {start|stop|restart|status}"
  echo "commands:"
  echo "  start   - Start OODT in a separate window."
  echo "  stop    - Stop OODT."
  echo "  restart - Stop and then start OODT in a separate window."
  echo "  status  - Display the current status of OODT components."
  echo ""
}

case "$1" in
  start) start ;;
  stop) stop ;;
  restart) restart ;;
  status) status ;;
  *) usage; exit 1
esac

exit 0

