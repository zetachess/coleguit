
var Tournament = function(json) {
	this.json = json;
}

var header1 = new Vue({
    el: '#header1',
    data: {
        message: 'I Want Crazyhouse!'
    }
});
    
    var table1 = new Vue({
        el: '#table1',
        data: {
            tournamentsTmp: [],
            tournaments: [],

            loading12: false,
            loading3: false,
            loading4: false,
            loading5: false,
            loading6: false
        },
        created: async function() {

			this.$data.loading3 = true;
			let r3 = fetchParseSortAndLoadTournamentsOfLichess(this.$data.tournaments);

			this.$data.loading12 = true;
			let r22 = fetchParseSortAndLoadTournamentsForUser(
							"https://lichess.org/api/user/blunderman1/tournament/created",
							this.$data.tournaments);
			await r22;
			this.$data.loading12 = false;
			await r3;
			this.$data.loading3 = false;

			///////////////////////////////////

			this.$data.loading4 = true;
			/////////////////////////////
			let r4 = fetchParseSortAndLoadTournamentsForUser( 
							"https://lichess.org/api/user/CyberShredder/tournament/created",
							this.$data.tournaments);


			this.$data.loading5 = true;
			let r5 = fetchParseSortAndLoadTournamentsForUser( 
							"https://lichess.org/api/user/TheFinnisher/tournament/created",
							this.$data.tournaments);

				
			await r4;
			this.$data.loading4 = false;
			await r5;
			this.$data.loading5 = false;

			/////////////////////////////////
			this.$data.loading6 = true;
			let r6 = fetchParseSortAndLoadTournamentsForUser( 
							"https://lichess.org/api/user/OFBC_Nigeria/tournament/created",
							this.$data.tournaments);

			let r7 = fetchParseSortAndLoadTournamentsForUser( 
							"https://lichess.org/api/user/adet2510/tournament/created",
							this.$data.tournaments);

			await r6;
			await r7;
			this.$data.loading6 = false;

                
	//////////
                
				

				
                
        },
        mounted: function() {
		},
		updated(){
			//alert('Updated hook has been called');
		},
        methods: {
			    moment : moment,
			    colorTournament : function(t){
					if (t.json["createdBy"]=="lichess"){
						return "#bce5dc";
					}
					if (t.json["createdBy"]=="blunderman1"){
						return "#c0e5bc";
					}
					if (t.json["createdBy"]=="thefinnisher"){
						return "#e5bce4";
					}
					if (t.json["createdBy"]=="cybershredder"){
						return "#e5d2bc";
					}
					if (t.json["createdBy"]=="ofbc_nigeria"){
						return "#bccde5";
					}
					if (t.json["createdBy"]=="adet2510"){
						return "#bccde5";
					}
					return "yellow";	
				}
        }
    });