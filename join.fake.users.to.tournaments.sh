apikey1=$1 #undergroundzh1
apikey2=$2 #undergroundzh2

for filename in *.json; do 
	tournamentId=$(eval cat ${filename} | jq -r .id); 


	joinCmd1="curl -s -X POST -H \"Authorization: Bearer $apikey1\" https://lichess.org/api/tournament/$tournamentId/join"
	joinCmd2="curl -s -X POST -H \"Authorization: Bearer $apikey2\" https://lichess.org/api/tournament/$tournamentId/join"

	$(eval $joinCmd1)
	$(eval $joinCmd2)

done
