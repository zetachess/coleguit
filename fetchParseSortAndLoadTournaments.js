function fetchParseSortAndLoadTournamentsForUser(url, tournaments){



	var result = fetch( url ).then( 
				function( response ) {
					if ( !response.ok ) {
						console.log(response);
						response.text().then(body => console.log(body));
						throw new Exception( response.status )
					}
					return response.text()
				}).then( function( text ) {
					var json = JSON.parse('['+text.split("}\n{").join("},{")+']');//oh fuck off NDJSON! because comma is not cool enough? TODO:how do i parse this shit properly
					for (var x in json){
						if (json[x]["status"] != 30 && json[x]["variant"]["key"] == "crazyhouse") {
							tournaments.push(new Tournament(json[x]));
						}
					}
				}).then ( function(){
					tournaments.sort(function(a, b){return a.json['startsAt']-b.json['startsAt']});
				}).catch( function( error ) {
					console.info( "Received error ", error);
				});

	return result;

}


///////////////////////////////////////

function fetchParseSortAndLoadTournamentsOfLichess(tournaments){

	var result = fetch( "https://lichess.org/api/tournament" ).then( function( response ) {
			if ( !response.ok ) {
				console.log(response);
				response.text().then(body => console.log(body));
				throw new Exception( response.status )
			}
			return response.json()
		}).then( function( json ) {

			for (var x in json["started"]){
				var t = json["started"][x];
				if (t["variant"]["key"]=="crazyhouse"){
					tournaments.push(new Tournament(t));
				}
			}
			
			for (var x in json["created"]){
				var t = json["created"][x];
				if (t["variant"]["key"]=="crazyhouse"){
					tournaments.push(new Tournament(t));
				}
			}
			
		}).then ( function(){
			tournaments.sort(function(a, b){return a.json['startsAt']-b.json['startsAt']});
		}).catch( function( error ) {
			console.info( "Received error ", error);
		});

	return result;

}