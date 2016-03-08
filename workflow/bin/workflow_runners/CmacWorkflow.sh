#!/bin/bash
#
# Runner script for the CMAC workflow.
#
# Usage:
#   ./CmacWorkflow.sh NetCdfFile
#
# Where:
#   NetCdfFile is a NetCDF file to ingest, validate and publish to ESGF.
#
# Examples:
#   ./CmacWorkflow.sh test.nc
#

# Get the NetCDF filename from the command line.
NetCdfFile=$1

${WORKFLOW_HOME}/bin/wmgr-client \
  --url $WORKFLOW_URL \
  --operation --sendEvent --eventName CmacWorkflow \
  --metaData --key NetCdfFile $NetCdfFile

