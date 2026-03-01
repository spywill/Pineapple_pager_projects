#!/bin/bash

# Title: GPS Compass
# Description: Compass in Bash by reading GPS data
# Author: spywill
# Version: 1.0

# USER PROMPT
PROMPT "Title: GPS Compass

Compass in Bash by reading GPS data

Press any button to stop"

# CONFIGURATION VARIABLES
MIN_SPEED_KMH=1        # Minimum speed in km/h to consider movement
SMOOTH_SAMPLES=5       # Number of recent headings to average for smoothing

# ARRAY AND STATE VARIABLES
declare -a headings     # Array to store recent heading samples for smoothing
last_direction=""       # Stores last calculated compass direction
got_fix=0               # Flag indicating if GPS fix has been acquired

# Function to check internet connectivity
is_online() {
	ping -c 1 -W 1 8.8.8.8 >/dev/null 2>&1
}

# Function display GPS Location via OpenStreetMap
current_location() {
	GPS=$(START_SPINNER "Fetching current location...")
	if is_online; then
		LOG yellow "Fetching current location..."
		LAT=$(gpspipe -w -n 10 2>/dev/null | grep '"lat"' | head -n1 | awk -F'"lat":' '{print $2}' | awk -F',' '{print $1}')
		LON=$(gpspipe -w -n 10 2>/dev/null | grep '"lon"' | head -n1 | awk -F'"lon":' '{print $2}' | awk -F',' '{print $1}')

		if [[ -n "$LAT" && -n "$LON" ]]; then
			LOCATION=$(curl -s \
				"https://nominatim.openstreetmap.org/reverse?format=json&lat=$LAT&lon=$LON" \
				-H "User-Agent: gps-terminal-tracker" |
				jq -r '.display_name' | tr ',' '\n' | sed 's/^/  /')
			LOG yellow "Current GPS coordinates:"
			LOG "$(GPS_GET)"
			LOG "$LOCATION"
		else
			LOG red "Waiting for GPS fix to fetch location..."
		fi
	else
		LOG red "offline – no map lookup"
		LOG yellow "Current GPS coordinates:"
		LOG "$(GPS_GET)"
	fi
	STOP_SPINNER ${GPS}
}
current_location

# Function to convert degrees to compass direction
get_direction() {
	# Array of compass directions
	directions=( \
		"N (North)" "NNE (North-Northeast)" "NE (Northeast)" "ENE (East-Northeast)" \
		"E (East)" "ESE (East-Southeast)" "SE (Southeast)" "SSE (South-Southeast)" \
		"S (South)" "SSW (South-Southwest)" "SW (Southwest)" "WSW (West-Southwest)" \
		"W (West)" "WNW (West-Northwest)" "NW (Northwest)" "NNW (North-Northwest)" \
	)

	deg=${1%.*}                # Remove any decimal part from degrees
	deg=$((10#$deg % 360))     # Ensure degrees is within 0-359

	index=$(( (deg + 11) / 22 ))   # Map degrees to 16 compass points
	echo "${directions[$index]}"   # Return compass direction with full name
}

LOG yellow "GPS Compass Started (Press any button to stop)"
LOG blue "--------------------------------------------------"

# MAIN GPS LOOP
# Read GPS data from gpspipe in JSON mode and process TPV lines
gpspipe -w | while read -r line; do

	if [[ "$line" == *'"class":"TPV"'* ]]; then

		# Extract heading and speed from GPS JSON
		heading=$(echo "$line" | awk -F'"track":' '{print $2}' | awk -F',' '{print $1}')
		speed=$(echo "$line" | awk -F'"speed":' '{print $2}' | awk -F',' '{print $1}')

		# If heading or speed is missing, wait for GPS fix
		if [[ -z "$heading" || -z "$speed" ]]; then
			LOG red "Waiting for GPS signal..."
			continue
		fi

		got_fix=1

		# Convert speed from m/s to km/h and integer part for comparisons
		speed_kmh=$(awk "BEGIN {printf \"%.1f\", $speed * 3.6}")
		speed_int=${speed_kmh%.*}

		# If speed below minimum, display last direction and skip averaging
		if (( speed_int < MIN_SPEED_KMH )); then
			LOG cyan "$(printf "Standing still Last direction: %-4s  Speed: %5s km/h" \
				"$last_direction" "$speed_kmh")"
			continue
		fi

		# Clean heading and add to smoothing array
		clean_heading=${heading%.*}
		headings+=("$clean_heading")

		# Keep only the most recent SMOOTH_SAMPLES headings
		if (( ${#headings[@]} > SMOOTH_SAMPLES )); then
			headings=("${headings[@]:1}")
		fi

		# Compute average heading
		sum=0
		for h in "${headings[@]}"; do
			sum=$((sum + 10#$h))
		done

		avg=$((sum / ${#headings[@]}))

		# Convert average heading to compass direction
		direction=$(get_direction "$avg")
		last_direction="$direction"

		# Display heading and speed
		LOG yellow "$(printf "Heading: %3d°  %-3s   Speed: %5s km/h" \
			"$avg" "$direction" "$speed_kmh")"
	fi

	# If no TPV lines received yet, indicate waiting for GPS
	if [[ $got_fix -eq 0 ]]; then
		LOG red "Waiting for GPS signal..."
	fi
done &

# Store PID of background GPS loop
PID=$!

# WAIT FOR USER INPUT TO STOP COMPASS
button=$(WAIT_FOR_INPUT)
case "$button" in
	*)
		kill -9 "$PID"   # Kill GPS loop when any button pressed
		sleep 1
		current_location
		exit
		;;
esac
