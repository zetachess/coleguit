#apikey1=y4y4Pu6MRoDZhIPX #blundertulpa1
#apikey2=EuLzmogcYk4J5SIh #blundertulpa2
apikey1=$1 #TSAs2ACOz13F2w5e #undergroundzh1
apikey2=$2 #ZlfQVGw8O70FZRWU #undergroundzh2
dir_with_jsons=$3

echo "$apikey1"
echo "$apikey2"

for filename in ./$dir_with_jsons/*.json; do 
	tournamentId=$(eval cat ${filename} | jq -r .id); 


	joinCmd1="curl -s -X POST -H \"Authorization: Bearer $apikey1\" https://lichess.org/api/tournament/$tournamentId/join"
	joinCmd2="curl -s -X POST -H \"Authorization: Bearer $apikey2\" https://lichess.org/api/tournament/$tournamentId/join"

	echo $joinCmd1
	echo $joinCmd2

	x=$(eval $joinCmd1)
	echo "$x"
	x=$(eval $joinCmd2)
	echo "$x"

done