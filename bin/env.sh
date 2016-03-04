#!/bin/bash

# UNIX
export CMAC_HOME=/usr/local/cmac
export OODT_HOME=$CMAC_HOME/oodt
export OODT_DATA=$OODT_HOME/data
export OODT_RUN=$OODT_HOME/run
export OODT_BIN=$OODT_HOME/bin
export FILEMGR_HOME=$OODT_HOME/filemgr
export PCS_HOME=$OODT_HOME/pcs
export PGE_HOME=$OODT_HOME/pge
export RESOURCE_HOME=$OODT_HOME/resource
export WORKFLOW_HOME=$OODT_HOME/workflow

# Ports
export FILEMGR_PORT=9000
export WORKFLOW_PORT=9001
export RESOURCE_PORT=9002

# URLs
export FILEMGR_URL=http://cmac:$FILEMGR_PORT
export WORKFLOW_URL=http://cmac:$WORKFLOW_PORT
export RESOURCE_URL=http://cmac:$RESOURCE_PORT

# Executables
export FILEMGR_EXEC=filemgr
export WORKFLOW_EXEC=wmgr
export RESOURCE_EXEC=resmgr

# PCS
alias pcs_stat='$PCS_HOME/scripts/pcs_stat'

# OODT
alias oodt=$OODT_BIN/oodt.sh

# Workflow Manager Client
alias workflows='$WORKFLOW_HOME/bin/wmgr-client --url $WORKFLOW_URL --operation --getWorkflows'
alias workflow_insts='$WORKFLOW_HOME/bin/wmgr-client --url $WORKFLOW_URL --operation --getWorkflowInsts'
alias workflow_info='$WORKFLOW_HOME/bin/wmgr-client --url $WORKFLOW_URL --operation --getWorkflowInstMet --id'
alias workflow_events='$WORKFLOW_HOME/bin/wmgr-client --url $WORKFLOW_URL --operation --getRegisteredEvents'
alias stop_workflow='$WORKFLOW_HOME/bin/wmgr-client --url $WORKFLOW_URL --operation --stopWorkflowInst --id'

# Resource Manager Client
alias resource_nodes='$RESOURCE_HOME/bin/resmgr-client --url $RESOURCE_URL --operation --getNodes'
alias resource_node_load='$RESOURCE_HOME/bin/resmgr-client --url $RESOURCE_URL --operation --getNodeLoad --nodeId'
alias resource_nodes_in_queue='$RESOURCE_HOME/bin/resmgr-client --url $RESOURCE_URL --operation --getNodesInQueue --queueName'
alias resource_queues='$RESOURCE_HOME/bin/resmgr-client --url $RESOURCE_URL --operation --getQueues'
alias resource_queues_with_node='$RESOURCE_HOME/bin/resmgr-client --url $RESOURCE_URL --operation --getQueuesWithNode --nodeId'

