#!/bin/bash

function log {
	echo -n "[+] "
	echo $1
}

server_output_file=server-output.log
server_errors_file=server-errors.log
sonic_output_file=sonic-pi-output.log

# Start jack server for sonic-pi:

pasuspender -- jackd -R -d alsa 1>$server_output_file 2>$server_errors_file &
server_pid=$!
log "The server was started with the pid=$server_pid."

sleep 1


# Start Sonic Pi process:

sonic-pi 1>$sonic_output_file 2>$sonic_output_file &
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
