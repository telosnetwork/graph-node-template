#!/bin/bash

INSTALL_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $INSTALL_ROOT/config.ini

LOG_NAME="$(basename $INSTALL_ROOT)"
LOG_PATH="$INSTALL_ROOT/$LOG_NAME.log"

CMD="cargo run --manifest-path $CARGO_PATH -p graph-node --release -- \
  --postgres-url postgresql://$PG_USER:$PG_PASS@$PG_HOST:$PG_PORT/$PG_DB_NAME \
  --ethereum-rpc $RPC_NAME:$RPC_URL \
  --ipfs $IPFS_HOST:$IPFS_PORT"

nohup $CMD >> "$LOG_PATH" 2>&1 &
PID="$!"
echo "graph-node started with pid $PID"
echo $PID > $INSTALL_ROOT/graph-node.pid