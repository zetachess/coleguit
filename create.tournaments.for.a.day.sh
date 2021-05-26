
apikey1=$1 #undergroundzh1
apikey2=$2 #undergroundzh2

starthour=(0	1	3	4	6	7	9	10	12	13	15	16	18	19	21	22	23)
startmins=(0	0	0	0	0	0	0	0	0	0	0	0	0	0	30	0	0)
durminute=(60	60	60	60	60	60	60	60	60	60	60	60	60	60	30	60	60)
clockTime=(2	3	5	1	1	2	3	3	1	5	1	3	2	3	1	3	2)
clockIncr=(0	2	0	2	0	0	2	0	2	0	0	0	0	2	0	0	0)

numoftour=17

#Epoch timestamp: 1621641600
#Timestamp in milliseconds: 1621641600000
#Date and time (GMT): Saturday, May 22, 2021 0:00:00 

may22_midnight=1621641600000
min=1000*60
hour=1000*60*60
day=24*hour
iter=4

startDate=$((may22_midnight + day*iter))

NEWLINE=$'\n'

#testCmd="echo '{\"id\":\"ZAtMNwrP\",\"createdBy\":\"blunderman1\"}'"
#name=ZH+Hourly&clockTime=3&clockIncrement=2&minutes=60&startDate=1621793783000&variant=crazyhouse&description=Bookmark+this+[https://nnickoloff1234.github.io/i.want.crazyhouse.html](https://nnickoloff1234.github.io/i.want.crazyhouse.html)%0AAlso [Crazyhouse Curator team](https://lichess.org/team/crazyhouse-curator)

for x in $( seq 0 $((numoftour-1)) )
#for x in $( seq 4 16 )
do
	echo "============================================================"
	echo "= $x  ======================================================"

	ts=$(( startDate+(starthour[x]*hour)+startmins[x]*min ))

	echo "$ts ${durminute[x]} ${clockTime[x]} ${clockIncr[x]}"
	
	key=$apikey1

	if [ $x -gt 8 ]
	then
		key=$apikey2
	fi

	actualCmd="curl -s -X POST -H \"Authorization: Bearer $key\" -d 'name=Underground+ZH+Hourly+$(( x+1 ))&clockTime=${clockTime[x]}&clockIncrement=${clockIncr[x]}&minutes=${durminute[x]}&startDate=$ts&variant=crazyhouse&description=Bookmark:+[https://iwantzh.github.io/](https://iwantzh.github.io/)%0Ato+easily+find+the+currently+running+zh+tournament.There+is+always+one+24/7%0A%0AJoin:+[Crazyhouse Curator team](https://lichess.org/team/crazyhouse-curator)%0Ato+learn+about+other+community+organized+tournaments' https://lichess.org/api/tournament"

	echo "$actualCmd"

	#########################################################
	#create tournaments - get ids

	responseJson=$(eval $actualCmd)
	#echo "responseJson="
	echo $'\e[1;33m'$responseJson$'\e[0m'
	echo $responseJson > "$ts.json"

	#tournamentId=$(eval echo '$responseJson' | jq .id)
	#tournamentId="${tournamentId1//\"/}"

	#echo "------------------------------------------------------------"
	#echo "tournamentId=$tournamentId"

	#########################################################
	#join

	#joinCmd1="curl -s -X POST -H \"Authorization: Bearer $apikey1\" https://lichess.org/api/tournament/$tournamentId/join"
	#joinCmd2="curl -s -X POST -H \"Authorization: Bearer $apikey2\" https://lichess.org/api/tournament/$tournamentId/join"


	#echo $joinCmd1
	#echo $joinCmd2

	#$(eval $joinCmd1)
	#$(eval $joinCmd2)

done

