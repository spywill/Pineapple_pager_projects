#!/bin/bash

# Title: Fake ME
# Description: Generates random fictional US and Canadian identities with personal, employment, family, financial, and identification details. 
# Author: spywill
# Version: 1.0

COUNT=1

COUNTRY_PICK=$(LIST_PICKER "Choose country" \
	"USA" \
	"Canada" \
	"Exit" \
	"Exit")

case "$COUNTRY_PICK" in
	"USA") COUNTRY="US" ;;
	"Canada") COUNTRY="CA" ;;
	"Exit") exit 0 ;;
esac

GENDER_PICK=$(LIST_PICKER "Choose gender" \
	"Male" \
	"Female" \
	"Exit" \
	"Exit")

case "$GENDER_PICK" in
	"Male") GENDER_SELECTION="Male" ;;
	"Female") GENDER_SELECTION="Female" ;;
	"Exit") exit 0 ;;
esac

US_STATES=(
	"Illinois|IL|Chicago|60601"
	"California|CA|Los Angeles|90001"
	"New York|NY|New York|10001"
	"Texas|TX|Houston|77001"
	"Arizona|AZ|Phoenix|85001"
	"Pennsylvania|PA|Philadelphia|19101"
	"Ohio|OH|Columbus|43004"
	"Georgia|GA|Atlanta|30301"
	"North Carolina|NC|Charlotte|28201"
	"Michigan|MI|Detroit|48201"
	"Washington|WA|Seattle|98101"
	"Colorado|CO|Denver|80201"
	"Nevada|NV|Las Vegas|88901"
	"Massachusetts|MA|Boston|02108"
	"Tennessee|TN|Nashville|37201"
	"Indiana|IN|Indianapolis|46201"
	"Missouri|MO|St. Louis|63101"
	"Wisconsin|WI|Milwaukee|53201"
	"Minnesota|MN|Minneapolis|55401"
	"Oregon|OR|Portland|97201"
)

CA_PROVINCES=(
	"Ontario|ON|Toronto|M5V 3L9"
	"Ontario|ON|Ottawa|K1A 0B1"
	"British Columbia|BC|Vancouver|V5K 0A1"
	"British Columbia|BC|Victoria|V8W 1P6"
	"Alberta|AB|Calgary|T2P 1J9"
	"Alberta|AB|Edmonton|T5J 0N3"
	"Quebec|QC|Montreal|H2X 1Y4"
	"Quebec|QC|Quebec City|G1A 0A2"
	"Manitoba|MB|Winnipeg|R3C 4T3"
	"Saskatchewan|SK|Regina|S4P 3Y2"
	"Nova Scotia|NS|Halifax|B3H 1Y3"
	"New Brunswick|NB|Fredericton|E3B 1A1"
	"Newfoundland and Labrador|NL|St. John's|A1A 1A1"
	"Prince Edward Island|PE|Charlottetown|C1A 1A1"
)

MALE_FIRST_NAMES=(
	"James" "John" "Robert" "Michael" "David" "William"
	"Richard" "Joseph" "Thomas" "Charles" "Christopher"
	"Daniel" "Matthew" "Anthony" "Mark" "Donald"
	"Steven" "Paul" "Andrew" "Joshua" "Kevin"
	"Brian" "George" "Edward" "Ronald" "Timothy"
	"Jason" "Jeffrey" "Ryan" "Jacob" "Gary"
	"Nicholas" "Eric" "Jonathan" "Stephen" "Larry"
	"Justin" "Scott" "Brandon" "Benjamin"
)

FEMALE_FIRST_NAMES=(
	"Mary" "Patricia" "Jennifer" "Linda" "Elizabeth" "Susan"
	"Jessica" "Sarah" "Karen" "Nancy" "Lisa"
	"Margaret" "Betty" "Sandra" "Ashley" "Kimberly"
	"Emily" "Donna" "Michelle" "Dorothy" "Carol"
	"Amanda" "Melissa" "Deborah" "Stephanie"
	"Rebecca" "Sharon" "Laura" "Cynthia"
	"Kathleen" "Amy" "Shirley" "Angela"
	"Helen" "Anna" "Brenda" "Pamela"
	"Nicole" "Emma" "Samantha"
)

LAST_NAMES=(
	"Smith" "Johnson" "Williams" "Brown" "Jones"
	"Garcia" "Miller" "Davis" "Rodriguez" "Martinez"
	"Hernandez" "Lopez" "Gonzalez" "Wilson" "Anderson"
	"Thomas" "Taylor" "Moore" "Jackson" "Martin"
	"Lee" "Perez" "Thompson" "White" "Harris"
	"Sanchez" "Clark" "Ramirez" "Lewis" "Robinson"
	"Walker" "Young" "Allen" "King" "Wright"
	"Scott" "Torres" "Nguyen" "Hill" "Flores"
)

STREETS=(
	"Main St" "Oak Ave" "Maple Rd" "Pine St" "Cedar Ln"
	"Elm St" "Washington Ave" "Lakeview Dr" "Hillcrest Rd"
	"Sunset Blvd" "Riverside Dr" "Park Ave"
	"Highland Ave" "Broadway St" "Center St"
	"Cherry Ln" "North St" "South St" "East Ave" "West Ave"
)

EMAIL_DOMAINS=(
	"gmail.com" "outlook.com" "yahoo.com" "hotmail.com"
	"icloud.com" "protonmail.com" "live.com"
)

COMPANIES=(
	"TechCorp" "GlobalSoft" "NextGen Systems" "BlueWave Inc" "Vertex Solutions"
	"Skyline Technologies" "Pioneer Labs" "Quantum Dynamics"
	"Evergreen Solutions" "Summit Enterprises"
	"NovaTech" "Apex Innovations" "FusionWorks"
	"Prime Industries" "Nimbus Cloud Services"
)

JOBS=(
	"Software Engineer" "Accountant" "Sales Manager" "Data Analyst"
	"Customer Support" "Project Manager" "Marketing Specialist"
	"Business Analyst" "HR Coordinator" "Financial Advisor"
	"Operations Manager" "Product Manager" "UX Designer"
	"Network Engineer" "Systems Administrator"
	"Graphic Designer" "Consultant" "Retail Manager"
)

# ADDITIONAL EMPLOYMENT
DEPARTMENTS=(
	"Information Technology" "Human Resources" "Finance"
	"Marketing" "Sales" "Engineering" "Operations"
	"Customer Service" "Research and Development"
	"Administration" "Security" "Logistics"
)

EMPLOYMENT_TYPES=(
	"Full-Time" "Part-Time"
	"Contract" "Temporary"
	"Freelance"
)

WORK_LOCATIONS=(
	"Office" "Remote"
	"Hybrid" "On-Site"
)

EMPLOYMENT_STATUS=(
	"Active" "On Leave" "Probation"
)

# PERSONAL INTERESTS
HOBBIES=(
	"Photography" "Gaming" "Fishing"
	"Reading" "Traveling" "Cooking"
	"Hiking" "Cycling" "Gardening"
	"Woodworking" "Painting" "Collecting"
	"Technology" "Programming" "Car Restoration"
	"Fitness" "Camping" "Music Production"
)

MUSIC_GENRES=(
	"Rock" "Pop" "Hip Hop" "Country"
	"Jazz" "Electronic" "Classical"
	"R&B" "Metal" "Indie"
	"Alternative" "Blues"
)

SPORTS=(
	"Basketball" "Football" "Soccer"
	"Baseball" "Hockey" "Tennis"
	"Golf" "Boxing" "Swimming"
	"Running" "Wrestling"
	"Motorsports"
)

FAVORITE_FOODS=(
	"Pizza" "Burgers" "Sushi"
	"Tacos" "Pasta" "Steak"
	"BBQ" "Chinese Food"
	"Indian Food" "Seafood"
	"Sandwiches" "Chicken Wings"
)

MOVIE_GENRES=(
	"Action" "Comedy" "Horror"
	"Science Fiction" "Thriller"
	"Drama" "Documentary"
	"Fantasy" "Adventure"
	"Mystery"
)

TRAVEL_DESTINATIONS=(
	"New York" "Los Angeles" "Toronto"
	"London" "Paris" "Tokyo" "Las Vegas"
	"Miami" "Vancouver" "Rome" "Sydney"
	"Amsterdam"
)

generate_interests() {
	HOBBY=$(rand_element "${HOBBIES[@]}")
	HOBBY2=$(rand_element "${HOBBIES[@]}")
	MUSIC=$(rand_element "${MUSIC_GENRES[@]}")
	SPORT=$(rand_element "${SPORTS[@]}")
	FOOD=$(rand_element "${FAVORITE_FOODS[@]}")
	MOVIE=$(rand_element "${MOVIE_GENRES[@]}")
	DESTINATION=$(rand_element "${TRAVEL_DESTINATIONS[@]}")
}

generate_employment_details() {
	DEPARTMENT=$(rand_element "${DEPARTMENTS[@]}")
	EMPLOYMENT_TYPE=$(rand_element "${EMPLOYMENT_TYPES[@]}")
	WORK_LOCATION=$(rand_element "${WORK_LOCATIONS[@]}")
	EMP_STATUS=$(rand_element "${EMPLOYMENT_STATUS[@]}")
	# Annual salary (fictional)
	SALARY=$(rand_range 35000 150000)
	# Employee reference (fictional)
	EMPLOYEE_ID="EMP-$(rand_range 10000 99999)"
	# Years of experience
	EXPERIENCE=$(rand_range 1 30)
	# Previous employment
	PREVIOUS_COMPANY=$(rand_element "${COMPANIES[@]}")
	PREVIOUS_JOB=$(rand_element "${JOBS[@]}")
}

CARD_TYPES=("VISA" "MASTERCARD" "AMEX" "DISCOVER")

US_CARRIERS=("Verizon" "AT&T" "T-Mobile")
CA_CARRIERS=("Rogers" "Bell" "Telus")

US_INSURANCE_PROVIDERS=(
	"Aetna"
	"Blue Cross Blue Shield"
	"Cigna"
	"UnitedHealthcare"
	"Kaiser Permanente"
	"Humana"
)

# FAMILY INFORMATION
MARITAL_STATUSES=(
	"Single"
	"Married"
	"Divorced"
	"Widowed"
	"Separated"
)

generate_family() {
	MARITAL_STATUS=$(rand_element "${MARITAL_STATUSES[@]}")

	# Parents
	MOTHER_FIRST=$(rand_element "${FEMALE_FIRST_NAMES[@]}")
	FATHER_FIRST=$(rand_element "${MALE_FIRST_NAMES[@]}")
	MOTHER="$MOTHER_FIRST $LAST"
	FATHER="$FATHER_FIRST $LAST"

	# Spouse
	SPOUSE="None"
	if [ "$MARITAL_STATUS" == "Married" ]; then
		if [ "$GENDER" == "Male" ]; then
			SPOUSE_FIRST=$(rand_element "${FEMALE_FIRST_NAMES[@]}")
		else
			SPOUSE_FIRST=$(rand_element "${MALE_FIRST_NAMES[@]}")
		fi
		SPOUSE="$SPOUSE_FIRST $LAST"
	fi

	# Children
	CHILD_COUNT=$(rand_range 0 4)
	CHILDREN=()
	for ((c=1; c<=CHILD_COUNT; c++)); do
		if [ $((RANDOM % 2)) -eq 0 ]; then
			CHILD_FIRST=$(rand_element "${MALE_FIRST_NAMES[@]}")
		else
			CHILD_FIRST=$(rand_element "${FEMALE_FIRST_NAMES[@]}")
		fi
		CHILD_AGE=$(rand_range 1 17)
		CHILDREN+=("$CHILD_FIRST $LAST (Age: $CHILD_AGE)")
	done

	# Siblings
	SIBLING_COUNT=$(rand_range 0 4)
	SIBLINGS=()
	for ((s=1; s<=SIBLING_COUNT; s++)); do
		if [ $((RANDOM % 2)) -eq 0 ]; then
			SIBLING_FIRST=$(rand_element "${MALE_FIRST_NAMES[@]}")
		else
			SIBLING_FIRST=$(rand_element "${FEMALE_FIRST_NAMES[@]}")
		fi
		SIBLINGS+=("$SIBLING_FIRST $LAST")
	done
}

# AREA CODES
declare -A AREA_CODES

# US
AREA_CODES["IL"]="312 773 872"
AREA_CODES["CA"]="213 310 424"
AREA_CODES["NY"]="212 646 917"
AREA_CODES["TX"]="713 281 832"
AREA_CODES["AZ"]="602 480"
AREA_CODES["PA"]="215 267"
AREA_CODES["OH"]="614 380"
AREA_CODES["GA"]="404 470"
AREA_CODES["NC"]="704 980"
AREA_CODES["MI"]="313 679"
AREA_CODES["WA"]="206 425"
AREA_CODES["CO"]="303 720"
AREA_CODES["NV"]="702 725"
AREA_CODES["MA"]="617 857"
AREA_CODES["TN"]="615 629"
AREA_CODES["IN"]="317 463"
AREA_CODES["MO"]="314 557"
AREA_CODES["WI"]="414 534"
AREA_CODES["MN"]="612 763"
AREA_CODES["OR"]="503 971"

# Canada
AREA_CODES["ON"]="416 647 437"
AREA_CODES["BC"]="604 778 236"
AREA_CODES["AB"]="403 587 780"
AREA_CODES["QC"]="514 438"
AREA_CODES["MB"]="204 431"
AREA_CODES["SK"]="306 639"
AREA_CODES["NS"]="902 782"
AREA_CODES["NB"]="506"
AREA_CODES["NL"]="709"
AREA_CODES["PE"]="902"

# US EDUCATION BY STATE
declare -A US_HIGH_SCHOOLS_MAP
declare -A US_COLLEGES_MAP

US_HIGH_SCHOOLS_MAP["AL"]="Central High School|Huntsville High School"
US_COLLEGES_MAP["AL"]="University of Alabama|Auburn University"

US_HIGH_SCHOOLS_MAP["AZ"]="Phoenix Union High School|Central High School"
US_COLLEGES_MAP["AZ"]="Arizona State University|University of Arizona"

US_HIGH_SCHOOLS_MAP["AR"]="Little Rock Central High School|North Little Rock High School"
US_COLLEGES_MAP["AR"]="University of Arkansas|Arkansas State University"

US_HIGH_SCHOOLS_MAP["CA"]="Los Angeles High School|Hollywood High School|Venice High School"
US_COLLEGES_MAP["CA"]="UCLA|USC|Stanford University"

US_HIGH_SCHOOLS_MAP["CO"]="East High School|Denver South High School"
US_COLLEGES_MAP["CO"]="University of Colorado|Colorado State University"

US_HIGH_SCHOOLS_MAP["CT"]="Hartford High School|Central High School"
US_COLLEGES_MAP["CT"]="University of Connecticut|Yale University"

US_HIGH_SCHOOLS_MAP["DE"]="Dover High School|Newark High School"
US_COLLEGES_MAP["DE"]="University of Delaware|Delaware State University"

US_HIGH_SCHOOLS_MAP["FL"]="Miami Senior High School|Orlando High School"
US_COLLEGES_MAP["FL"]="University of Florida|Florida State University"

US_HIGH_SCHOOLS_MAP["GA"]="Grady High School|North Atlanta High School"
US_COLLEGES_MAP["GA"]="University of Georgia|Georgia Tech"

US_HIGH_SCHOOLS_MAP["IL"]="Lane Tech High School|Whitney Young High School|Lincoln Park High School"
US_COLLEGES_MAP["IL"]="University of Illinois|Northwestern University|DePaul University"

US_HIGH_SCHOOLS_MAP["IN"]="Shortridge High School|North Central High School"
US_COLLEGES_MAP["IN"]="Indiana University|Purdue University"

US_HIGH_SCHOOLS_MAP["IA"]="Des Moines East High School|Central High School"
US_COLLEGES_MAP["IA"]="University of Iowa|Iowa State University"

US_HIGH_SCHOOLS_MAP["KS"]="Wichita High School East|Topeka High School"
US_COLLEGES_MAP["KS"]="University of Kansas|Kansas State University"

US_HIGH_SCHOOLS_MAP["KY"]="Louisville Male High School|Central High School"
US_COLLEGES_MAP["KY"]="University of Kentucky|University of Louisville"

US_HIGH_SCHOOLS_MAP["LA"]="New Orleans High School|Baton Rouge High School"
US_COLLEGES_MAP["LA"]="Louisiana State University|Tulane University"

US_HIGH_SCHOOLS_MAP["ME"]="Portland High School|Deering High School"
US_COLLEGES_MAP["ME"]="University of Maine"

US_HIGH_SCHOOLS_MAP["MD"]="Baltimore City College|Frederick High School"
US_COLLEGES_MAP["MD"]="University of Maryland|Johns Hopkins University"

US_HIGH_SCHOOLS_MAP["MA"]="Boston Latin School|Cambridge Rindge and Latin"
US_COLLEGES_MAP["MA"]="Harvard University|MIT|Boston University"

US_HIGH_SCHOOLS_MAP["MI"]="Cass Technical High School|Central High School"
US_COLLEGES_MAP["MI"]="University of Michigan|Michigan State University"

US_HIGH_SCHOOLS_MAP["MN"]="Minneapolis Central High School|Washburn High School"
US_COLLEGES_MAP["MN"]="University of Minnesota"

US_HIGH_SCHOOLS_MAP["MS"]="Jackson Central High School|Murrah High School"
US_COLLEGES_MAP["MS"]="University of Mississippi|Mississippi State University"

US_HIGH_SCHOOLS_MAP["MO"]="Central High School|St. Louis University High"
US_COLLEGES_MAP["MO"]="University of Missouri|Washington University in St. Louis"

US_HIGH_SCHOOLS_MAP["MT"]="Billings Senior High School|Helena High School"
US_COLLEGES_MAP["MT"]="University of Montana|Montana State University"

US_HIGH_SCHOOLS_MAP["NE"]="Omaha Central High School|Lincoln High School"
US_COLLEGES_MAP["NE"]="University of Nebraska"

US_HIGH_SCHOOLS_MAP["NV"]="Las Vegas High School|Reno High School"
US_COLLEGES_MAP["NV"]="University of Nevada Las Vegas|University of Nevada Reno"

US_HIGH_SCHOOLS_MAP["NH"]="Manchester Central High School|Nashua High School"
US_COLLEGES_MAP["NH"]="University of New Hampshire"

US_HIGH_SCHOOLS_MAP["NJ"]="Newark Central High School|Trenton Central High School"
US_COLLEGES_MAP["NJ"]="Rutgers University|Princeton University"

US_HIGH_SCHOOLS_MAP["NM"]="Albuquerque High School|Santa Fe High School"
US_COLLEGES_MAP["NM"]="University of New Mexico"

US_HIGH_SCHOOLS_MAP["NY"]="Stuyvesant High School|Brooklyn Tech|Bronx Science"
US_COLLEGES_MAP["NY"]="NYU|Columbia University|CUNY"

US_HIGH_SCHOOLS_MAP["NC"]="Charlotte Central High School|Raleigh High School"
US_COLLEGES_MAP["NC"]="University of North Carolina|NC State University"

US_HIGH_SCHOOLS_MAP["ND"]="Fargo North High School|Bismarck High School"
US_COLLEGES_MAP["ND"]="University of North Dakota"

US_HIGH_SCHOOLS_MAP["OH"]="Columbus East High School|Cleveland Central High"
US_COLLEGES_MAP["OH"]="Ohio State University|University of Cincinnati"

US_HIGH_SCHOOLS_MAP["OK"]="Oklahoma City High School|Tulsa Central High"
US_COLLEGES_MAP["OK"]="University of Oklahoma|Oklahoma State University"

US_HIGH_SCHOOLS_MAP["OR"]="Portland High School|Grant High School"
US_COLLEGES_MAP["OR"]="University of Oregon|Oregon State University"

US_HIGH_SCHOOLS_MAP["PA"]="Central High School|Philadelphia High School|Pittsburgh High School"
US_COLLEGES_MAP["PA"]="University of Pennsylvania|Penn State University"

US_HIGH_SCHOOLS_MAP["RI"]="Providence High School|Central Falls High"
US_COLLEGES_MAP["RI"]="University of Rhode Island|Brown University"

US_HIGH_SCHOOLS_MAP["SC"]="Charleston High School|Columbia High School"
US_COLLEGES_MAP["SC"]="University of South Carolina|Clemson University"

US_HIGH_SCHOOLS_MAP["SD"]="Sioux Falls High School|Rapid City High"
US_COLLEGES_MAP["SD"]="University of South Dakota"

US_HIGH_SCHOOLS_MAP["TN"]="Hume-Fogg Academic High School|East High School|Central High School"
US_COLLEGES_MAP["TN"]="University of Tennessee|Vanderbilt University|Tennessee State University"

US_HIGH_SCHOOLS_MAP["TX"]="Bellaire High School|Lamar High School"
US_COLLEGES_MAP["TX"]="University of Texas|Texas A&M|Rice University"

US_HIGH_SCHOOLS_MAP["UT"]="Salt Lake High School|East High School"
US_COLLEGES_MAP["UT"]="University of Utah"

US_HIGH_SCHOOLS_MAP["VT"]="Burlington High School|Montpelier High School"
US_COLLEGES_MAP["VT"]="University of Vermont"

US_HIGH_SCHOOLS_MAP["VA"]="Richmond High School|Thomas Jefferson High"
US_COLLEGES_MAP["VA"]="University of Virginia|Virginia Tech"

US_HIGH_SCHOOLS_MAP["WA"]="Garfield High School|Roosevelt High School"
US_COLLEGES_MAP["WA"]="University of Washington|Washington State University"

US_HIGH_SCHOOLS_MAP["WV"]="Charleston High School|Huntington High School"
US_COLLEGES_MAP["WV"]="West Virginia University"

US_HIGH_SCHOOLS_MAP["WI"]="Milwaukee High School|Madison Central High"
US_COLLEGES_MAP["WI"]="University of Wisconsin"

US_HIGH_SCHOOLS_MAP["WY"]="Cheyenne Central High School|Casper High School"
US_COLLEGES_MAP["WY"]="University of Wyoming"


# CANADA EDUCATION BY PROVINCE
declare -A CA_HIGH_SCHOOLS_MAP
declare -A CA_COLLEGES_MAP

CA_HIGH_SCHOOLS_MAP["ON"]="Northern Secondary School|Central Technical School"
CA_COLLEGES_MAP["ON"]="University of Toronto|York University|Ryerson University"

CA_HIGH_SCHOOLS_MAP["BC"]="Burnaby Central Secondary|Kitsilano Secondary"
CA_COLLEGES_MAP["BC"]="University of British Columbia|Simon Fraser University"

CA_HIGH_SCHOOLS_MAP["AB"]="Western Canada High School|Queen Elizabeth High School"
CA_COLLEGES_MAP["AB"]="University of Alberta|University of Calgary"

CA_HIGH_SCHOOLS_MAP["QC"]="Westmount High School|Royal West Academy"
CA_COLLEGES_MAP["QC"]="McGill University|Université de Montréal"

CA_HIGH_SCHOOLS_MAP["MB"]="Winnipeg High School|Kelvin High School"
CA_COLLEGES_MAP["MB"]="University of Manitoba"

CA_HIGH_SCHOOLS_MAP["SK"]="Regina Central Collegiate|Saskatoon High School"
CA_COLLEGES_MAP["SK"]="University of Saskatchewan"

CA_HIGH_SCHOOLS_MAP["NS"]="Halifax West High School|Citadel High School"
CA_COLLEGES_MAP["NS"]="Dalhousie University"

CA_HIGH_SCHOOLS_MAP["NB"]="Fredericton High School|Moncton High School"
CA_COLLEGES_MAP["NB"]="University of New Brunswick"

CA_HIGH_SCHOOLS_MAP["NL"]="St. John's High School|Prince of Wales Collegiate"
CA_COLLEGES_MAP["NL"]="Memorial University of Newfoundland"

CA_HIGH_SCHOOLS_MAP["PE"]="Charlottetown Rural High School|Colonel Gray High School"
CA_COLLEGES_MAP["PE"]="University of Prince Edward Island"

generate_education() {
	# THIS PART IS REQUIRED
	if [ "$COUNTRY" == "CA" ]; then
		HS_LIST=${CA_HIGH_SCHOOLS_MAP[$CODE]}
		COLLEGE_LIST=${CA_COLLEGES_MAP[$CODE]}
	else
		HS_LIST=${US_HIGH_SCHOOLS_MAP[$CODE]}
		COLLEGE_LIST=${US_COLLEGES_MAP[$CODE]}
	fi
	# High School
	if [ -z "$HS_LIST" ]; then
		HS="Central High School"
	else
		IFS='|' read -ra HS_ARRAY <<< "$HS_LIST"
		HS=${HS_ARRAY[$RANDOM % ${#HS_ARRAY[@]}]}
	fi
	# College
	if [ -z "$COLLEGE_LIST" ]; then
		COLLEGE="State University"
	else
		IFS='|' read -ra COLLEGE_ARRAY <<< "$COLLEGE_LIST"
		COLLEGE=${COLLEGE_ARRAY[$RANDOM % ${#COLLEGE_ARRAY[@]}]}
	fi
	HS_YEAR=$(( $(date +%Y) - AGE + 18 ))
	COLLEGE_YEAR=$((HS_YEAR + 4))
}

# HELPERS
rand_range() {
	local min=$1
	local max=$2
	echo $((RANDOM % (max - min + 1) + min))
}

rand_element() {
	local arr=("$@")
	echo "${arr[$RANDOM % ${#arr[@]}]}"
}

# DOB
generate_dob() {
	AGE=$(rand_range 18 80)
	YEAR=$(($(date +%Y) - AGE))
	MONTH=$(printf "%02d" $(rand_range 1 12))
	DAY=$(printf "%02d" $(rand_range 1 28))
	DOB="$YEAR-$MONTH-$DAY"
}

# SSN / SIN
generate_id_number() {
	if [ "$COUNTRY" == "US" ]; then
		ID_NUMBER="$(rand_range 100 999)-$(rand_range 10 99)-$(rand_range 1000 9999)"
		ID_LABEL="SSN"
	else
		ID_NUMBER="$(rand_range 100 999) $(rand_range 100 999) $(rand_range 100 999)"
		ID_LABEL="SIN"
	fi
}

# IBAN 
generate_iban() {
	COUNTRY_CODES=("DE" "FR" "ES" "NL" "IT")
	CC=$(rand_element "${COUNTRY_CODES[@]}")
	IBAN="$CC$(rand_range 10 99)"
	for ((i=0; i<18; i++)); do
		IBAN+=$((RANDOM % 10))
	done
}

# LUHN
luhn_checksum() {
	local num=$1 sum=0 alt=0
	for (( i=${#num}-1; i>=0; i-- )); do
		digit=${num:$i:1}
		if (( alt )); then
			digit=$((digit * 2))
			(( digit > 9 )) && digit=$((digit - 9))
		fi
		sum=$((sum + digit))
		alt=$((1 - alt))
	done
	echo $((sum % 10))
}

# CARD
generate_card() {
	TYPE=$(rand_element "${CARD_TYPES[@]}")
	case $TYPE in
		VISA) PREFIX="4"; LENGTH=16 ;;
		MASTERCARD) PREFIX=$(rand_range 51 55); LENGTH=16 ;;
		AMEX) PREFIX=$(rand_element 34 37); LENGTH=15 ;;
		DISCOVER) PREFIX="6011"; LENGTH=16 ;;
	esac

	NUMBER="$PREFIX"

	while [ ${#NUMBER} -lt $((LENGTH - 1)) ]; do
		NUMBER+=$((RANDOM % 10))
	done
	for d in $(seq 0 9); do
		if [ "$(luhn_checksum "$NUMBER$d")" -eq 0 ]; then
			NUMBER+=$d
			break
		fi
	done
	echo "$TYPE|$NUMBER"
}

format_card() {
	if [ ${#1} -eq 15 ]; then
		echo "$1" | sed -E 's/^(.{4})(.{6})(.{5})$/\1-\2-\3/'
	else
		echo "$1" | sed 's/.\{4\}/&-/g;s/-$//'
	fi
}

# DRIVER LICENSE
generate_dl() {
	# Extract DOB parts
	YEAR=$(echo "$DOB" | cut -d'-' -f1)
	MONTH=$(echo "$DOB" | cut -d'-' -f2)
	DAY=$(echo "$DOB" | cut -d'-' -f3)

	# Name fragments (uppercase, padded)
	LAST_CLEAN=$(echo "$LAST" | tr '[:lower:]' '[:upper:]')
	FIRST_CLEAN=$(echo "$FIRST" | tr '[:lower:]' '[:upper:]')

	LAST_PART=$(printf "%-5s" "$LAST_CLEAN" | tr ' ' 'X' | cut -c1-5)
	FIRST_INIT=$(echo "$FIRST_CLEAN" | cut -c1)

	case $CODE in
		# ILLINOIS (REALISTIC STYLE)
		IL)
			# Example style: S532-1234-5678
			NUM1=$(rand_range 100 999)
			NUM2=$(rand_range 1000 9999)
			NUM3=$(rand_range 1000 9999)
			DL="${LAST_PART:0:1}${NUM1}-${NUM2}-${NUM3}"
		;;
		# TENNESSEE (DOB-INFLUENCED)
		TN)
			# Uses DOB heavily: YYMMDD + random
			DL="${YEAR:2:2}${MONTH}${DAY}$(rand_range 10 99)"
		;;
		# CALIFORNIA (NAME + NUMERIC)
		CA)
			# First letter of last name + 7 digits
			DL="${LAST_PART:0:1}$(rand_range 1000000 9999999)"
		;;
		# NEW YORK (9 DIGITS, WEIGHTED BY DOB)
		NY)
			DL="${YEAR:2:2}${MONTH}$(rand_range 10000 99999)"
		;;
		# TEXAS (8 DIGITS, DOB INFLUENCE)
		TX)
			DL="${MONTH}${DAY}$(rand_range 100000 999999)"
		;;
		# ARIZONA (NAME + LONG NUMERIC)
		AZ)
			DL="${LAST_PART:0:1}$(rand_range 10000000 99999999)"
		;;
		# ONTARIO (VERY REALISTIC STYLE)
		ON)
			# Format: LASTF + YYMM + random block
			DL="${LAST_PART}${FIRST_INIT}$(echo $YEAR | cut -c3-4)${MONTH}-$(rand_range 10000 99999)"
		;;
		# QUEBEC (NAME + DOB ENCODED)
		QC)
			# 4 letters + DOB chunks
			DL="${LAST_PART:0:4} ${YEAR:2:2}${MONTH}${DAY} $(rand_range 1000 9999)"
		;;
		# DEFAULT (SMART FALLBACK)
		*)
			DL="${LAST_PART:0:1}${FIRST_INIT}${YEAR:2:2}${MONTH}${DAY}$(rand_range 100 999)"
		;;
	esac
}

# HEALTH CARD / PROV ID
generate_hc() {
	case $CODE in
		ON) HC="$(rand_range 1000 9999)-$(rand_range 100 999)-$(rand_range 100 999)" ;;
		QC) HC="$(printf "%c%c%c%c %04d %04d" \
			$((RANDOM%26+65)) $((RANDOM%26+65)) $((RANDOM%26+65)) $((RANDOM%26+65)) \
			$(rand_range 1000 9999) $(rand_range 1000 9999))" ;;
		BC) HC="$(rand_range 1000000000 9999999999)" ;;
		AB) HC="$(rand_range 1000000000 9999999999)" ;;
		*)  HC="$(rand_range 100000000 999999999)" ;;
	esac
}

generate_us_insurance() {
	INSURANCE=$(rand_element "${US_INSURANCE_PROVIDERS[@]}")
	# Member ID (alphanumeric, common format)
	MEMBER_ID="$(printf "%c%c%d%d%d%d%d%d%d" \
		$((RANDOM%26+65)) $((RANDOM%26+65)) \
		$(rand_range 0 9) $(rand_range 0 9) $(rand_range 0 9) \
		$(rand_range 0 9) $(rand_range 0 9) $(rand_range 0 9) $(rand_range 0 9))"
	# Group number
	GROUP_NUM="$(rand_range 100000 999999)"
}

# passport
generate_passport() {
	if [ "$COUNTRY" == "US" ]; then
		PASSPORT="$(rand_range 100000000 999999999)"
	else
		PASSPORT="$(printf "%c%c%d%d%d%d%d%d" \
			$((RANDOM%26+65)) $((RANDOM%26+65)) \
			$(rand_range 0 9) $(rand_range 0 9) \
			$(rand_range 0 9) $(rand_range 0 9) \
			$(rand_range 0 9) $(rand_range 0 9))"
	fi
}

# MAIN LOOP
for ((i=1; i<=COUNT; i++)); do

	# Gender + Name (selected from the Pager menu)
	GENDER="$GENDER_SELECTION"
	if [ "$GENDER" == "Male" ]; then
		FIRST=$(rand_element "${MALE_FIRST_NAMES[@]}")
	else
		FIRST=$(rand_element "${FEMALE_FIRST_NAMES[@]}")
	fi
	LAST=$(rand_element "${LAST_NAMES[@]}")

	generate_dob
	generate_id_number
	generate_iban
	generate_passport
	generate_family
	generate_interests

	# Gender-based height ranges (in inches)
	if [ "$GENDER" == "Male" ]; then
		TOTAL_INCHES=$(rand_range 64 78)
	else
		TOTAL_INCHES=$(rand_range 58 72)
	fi

	FEET=$((TOTAL_INCHES / 12))
	INCHES=$((TOTAL_INCHES % 12))

	# Weight based on height (simple realistic range)
	MIN_WEIGHT=$((TOTAL_INCHES * 2))
	MAX_WEIGHT=$((TOTAL_INCHES * 3))
	WEIGHT_LBS=$(rand_range $MIN_WEIGHT $MAX_WEIGHT)

	# VEHICLE
	declare -A CAR_MAP

	CAR_MAP["Toyota"]="Camry Corolla RAV4 Tacoma Highlander"
	CAR_MAP["Ford"]="F-150 Escape Explorer Mustang"
	CAR_MAP["Honda"]="Civic Accord CR-V Pilot"
	CAR_MAP["Chevrolet"]="Silverado Malibu Equinox Tahoe"
	CAR_MAP["BMW"]="3 Series 5 Series X3 X5"
	CAR_MAP["Tesla"]="Model 3 Model S Model X Model Y"

	# Pick brand
	CAR_BRAND=$(rand_element "${!CAR_MAP[@]}")

	# Pick valid model for that brand
	read -a MODELS <<< "${CAR_MAP[$CAR_BRAND]}"
	CAR_MODEL=${MODELS[$RANDOM % ${#MODELS[@]}]}

	# Year (weighted: newer cars more common)
	YEAR_CHANCE=$(rand_range 1 100)
	if [ $YEAR_CHANCE -le 60 ]; then
		CAR_YEAR=$(rand_range 2018 2024)
	elif [ $YEAR_CHANCE -le 90 ]; then
		CAR_YEAR=$(rand_range 2010 2017)
	else
		CAR_YEAR=$(rand_range 2000 2009)
	fi

	# Color
	CAR_COLOR=$(rand_element \
	"Black" "White" "Gray" "Silver" \
	"Blue" "Red" "Dark Blue" "Dark Gray")

	# License plate (simple realistic format)
	PLATE="$(printf "%c%c%c-%03d" \
	$((RANDOM%26+65)) $((RANDOM%26+65)) $((RANDOM%26+65)) \
	$(rand_range 100 999))"

	# Better eye colors
	EYE_COLOR=$(rand_element \
	"Brown" "Dark Brown" "Light Brown" \
	"Blue" "Dark Blue" "Light Blue" \
	"Green" "Hazel" "Gray" "Amber")

	# Hair color (age-aware)
	if [ "$AGE" -gt 50 ]; then
		HAIR_COLOR=$(rand_element \
		"Gray" "White" "Salt and Pepper" \
		"Black" "Brown")
	else
		HAIR_COLOR=$(rand_element \
		"Black" "Dark Brown" "Brown" "Light Brown" \
		"Blonde" "Dirty Blonde" "Strawberry Blonde" \
		"Red" "Auburn")
	fi

	COMPANY=$(rand_element "${COMPANIES[@]}")
	JOB=$(rand_element "${JOBS[@]}")
	generate_employment_details

	NUM=$(rand_range 1 9999)
	STREET=$(rand_element "${STREETS[@]}")
	DOMAIN=$(rand_element "${EMAIL_DOMAINS[@]}")

	if [ "$COUNTRY" == "CA" ]; then
		LOC=$(rand_element "${CA_PROVINCES[@]}")
		COUNTRY_NAME="Canada"
	else
		LOC=$(rand_element "${US_STATES[@]}")
		COUNTRY_NAME="United States"
	fi

	STATE=$(echo "$LOC" | cut -d'|' -f1)
	CODE=$(echo "$LOC" | cut -d'|' -f2)
	CITY=$(echo "$LOC" | cut -d'|' -f3)
	ZIP=$(echo "$LOC" | cut -d'|' -f4)

	# Get area codes for region
	IFS=' ' read -r -a CODES <<< "${AREA_CODES[$CODE]}"
	
	generate_dl
	generate_hc
	generate_education

	# Fallback if missing
	if [ -z "${CODES[*]}" ]; then
		AREA=$(rand_range 200 999)
	else
		AREA=${CODES[$RANDOM % ${#CODES[@]}]}
	fi

	# CARRIER
	if [ "$COUNTRY" == "US" ]; then
		CARRIER=$(rand_element "${US_CARRIERS[@]}")
	else
		CARRIER=$(rand_element "${CA_CARRIERS[@]}")
	fi

	if [ "$COUNTRY" == "US" ]; then
		generate_us_insurance
	fi

	PREFIX=$(rand_range 200 999)
	LINE=$(rand_range 1000 9999)

	PHONE="+1-$AREA-$PREFIX-$LINE"
	EMAIL_STYLE=$(rand_range 1 3)

	case $EMAIL_STYLE in
		1) EMAIL="$(echo "$FIRST.$LAST" | tr '[:upper:]' '[:lower:]')$(rand_range 10 99)@$DOMAIN" ;;
		2) EMAIL="$(echo "${FIRST:0:1}$LAST" | tr '[:upper:]' '[:lower:]')$(rand_range 100 999)@$DOMAIN" ;;
		3) EMAIL="$(echo "$FIRST$LAST" | tr '[:upper:]' '[:lower:]')@$DOMAIN" ;;
	esac

	# Bank
	if [ "$COUNTRY" == "US" ]; then
		ROUTING=$(rand_range 100000000 999999999)
		ACCOUNT=$(rand_range 10000000 99999999)
		BANK="US Bank"
	else
		TRANSIT=$(rand_range 10000 99999)
		INSTITUTION=$(rand_range 100 999)
		ACCOUNT=$(rand_range 1000000 9999999)
		BANK="Royal Bank"
	fi

	# Card
	RESULT=$(generate_card)
	TYPE=$(echo "$RESULT" | cut -d'|' -f1)
	CARD=$(echo "$RESULT" | cut -d'|' -f2)
	FORMATTED=$(format_card "$CARD")

	if [ "$TYPE" == "AMEX" ]; then
		CVC=$(rand_range 1000 9999)
	else
		CVC=$(rand_range 100 999)
	fi

	ROLL=$(rand_range 1 100)
	if [ $ROLL -le 70 ]; then
		STATUS="APPROVED"
	elif [ $ROLL -le 90 ]; then
		STATUS="DECLINED"
	else
		STATUS="EXPIRED"
	fi

	if [ "$STATUS" == "EXPIRED" ]; then
		EXP_YEAR=$(( $(date +%Y) - 1 ))
	else
		EXP_YEAR=$(( $(date +%Y) + (RANDOM % 5 + 1) ))
	fi

	EXP_MONTH=$(printf "%02d" $(rand_range 1 12))
	# OUTPUT
	LOG ""
	LOG blue "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	LOG yellow "Name: $FIRST $LAST"
	LOG blue "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	LOG ""

	LOG "Name: $FIRST $LAST
	Gender: $GENDER
	Age: $AGE
	DOB: $DOB
	$ID_LABEL: $ID_NUMBER"
	LOG ""

	LOG blue "--- Physical ---"
	LOG "Height: ${FEET}'${INCHES}
	Weight: ${WEIGHT_LBS} lbs
	Eyes: $EYE_COLOR
	Hair: $HAIR_COLOR"
	LOG ""

	LOG blue "--- Address ---"
	LOG "Address: $NUM $STREET
	City: $CITY
	State/Province: $STATE ($CODE)
	ZIP/Postal Code: $ZIP
	Country: $COUNTRY_NAME

	Phone: $PHONE
	Carrier: $CARRIER
	Email: $EMAIL"
	LOG ""

	LOG blue "--- Education ---"
	LOG "High School: $HS (Class of $HS_YEAR)
	College: $COLLEGE (Class of $COLLEGE_YEAR)"
	LOG ""

	LOG blue "--- Family Information ---"
	LOG "Marital Status: $MARITAL_STATUS
	Spouse: $SPOUSE
	Mother: $MOTHER
	Father: $FATHER"
	LOG ""

	LOG "Children: $CHILD_COUNT"
	if [ "$CHILD_COUNT" -gt 0 ]; then
		for CHILD in "${CHILDREN[@]}"; do
			LOG "$CHILD"
		done
	fi
	LOG ""

	LOG "Siblings: $SIBLING_COUNT"
	if [ "$SIBLING_COUNT" -gt 0 ]; then
		for SIBLING in "${SIBLINGS[@]}"; do
			LOG "$SIBLING"
		done
	fi
	LOG ""

	LOG blue "--- Employment ---"
	LOG "Company: $COMPANY
	Job Title: $JOB
	Department: $DEPARTMENT
	Employment Type: $EMPLOYMENT_TYPE
	Employment Status: $EMP_STATUS
	Work Location: $WORK_LOCATION
	Annual Salary: \$$(printf "%'d" "$SALARY")
	Employee ID: $EMPLOYEE_ID
	Experience: $EXPERIENCE years
	Previous Company: $PREVIOUS_COMPANY
	Previous Job: $PREVIOUS_JOB"
	LOG ""

	LOG blue "--- Personal Interests ---"
	LOG "Hobbies: $HOBBY, $HOBBY2
	Music: $MUSIC
	Sport: $SPORT
	Food: $FOOD
	Movie Genre: $MOVIE
	Dream Travel Destination: $DESTINATION"
	LOG ""

	LOG blue "--- IDs ---"
	LOG "Driver License ($CODE): $DL
	Vehicle: $CAR_YEAR $CAR_COLOR $CAR_BRAND $CAR_MODEL
	Plate: $PLATE"
	LOG ""

	if [ "$COUNTRY" == "US" ]; then
		LOG blue "--- Health Insurance ---"
		LOG "Provider: $INSURANCE
		Member ID: $MEMBER_ID
		Group Number: $GROUP_NUM"
	else
		LOG blue "--- Health Card ---"
		LOG "Health Card ($CODE): $HC"
	fi
	LOG ""

	LOG blue "--- Payment ---"
	LOG "Card Type: $TYPE
	Card Number: $FORMATTED
	Expiry: $EXP_MONTH/$EXP_YEAR
	CVC: $CVC
	Status: $STATUS"
	LOG ""

	LOG blue "--- Bank ---"
	LOG "Bank Name: $BANK"
	if [ "$COUNTRY" == "US" ]; then
		LOG "Routing Number: $ROUTING
		Account Number: $ACCOUNT"
	else
		LOG "Transit Number: $TRANSIT
		Institution Number: $INSTITUTION
		Account Number: $ACCOUNT"
	fi

	LOG ""
	LOG blue "--- International ---"
	LOG "IBAN: $IBAN
	Passport: $PASSPORT"
done
