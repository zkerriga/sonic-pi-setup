#!/bin/bash

function log {
	echo -n "[+] "
	echo $1
}

log_dir=$HOME/.sonic-pi/log/
mkdir -p $log_dir
server_output_file=$log_dir/script-server-output.log
server_errors_file=$log_dir/script-server-errors.log
sonic_output_file=$log_dir/script-sonic-pi-output.log
sonic_errors_file=$log_dir/script-sonic-pi-errors.log

# Start jack server for sonic-pi:

pasuspender -- jackd -R -d alsa 1>$server_output_file 2>$server_errors_file &
server_pid=$!
log "The server was started with the pid=$server_pid."

sleep 1

# Set Language:
export LANGUAGE=ru_RU.UTF-8

# Start Sonic Pi process:

sonic-pi 1>$sonic_output_file 2>$sonic_errors_file &
sonic_pi_pid=$!
log "The Sonic Pi was started with the pid=$sonic_pi_pid."


# End of program:

sleep 3

log "Waiting for the Sonic Pi process to complete..."
wait $sonic_pi_pid

log "The server with the pid=$server_pid was stopped!"
kill $server_pid

sleep 1
log "The script completed successfully!"
