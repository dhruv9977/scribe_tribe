const http = require('http');

const express = require('express');
const app = express();


app.use(express.json());
//I'm writing TODO>xyz for the remaining stuff on your end

app.post('/lookingForWriter', (req, res) => {
	try {
		const { phoneNo, name, age, examName, examSubject, examLanguageEnglish, examLanguageHindi, examLanguageGujarati, examUNIXTime, examDuration, examCity, examArea, examLat, examLong, commute } = req.body

		//TODO>save into db
		//newJobID<int>,phoneNo<int>,name<str>,age<int>,examName<str>,examSubject<str>,examLanguageEnglish<bool>,examLanguageHindi<bool>,examLanguageGujarati<bool>,examUNIXTime<int>,examDuration<int>,examCity<str>,examArea<str>,examLat<int>,examLong<int>,commute<bool>,acceptedBy<int=-1>
		res.send(200);
	}
	catch {
		res.send(500);
	}
});

app.post('/addWriter', (req, res) => {
	try {
		const { phoneNo, name, age, writerCity, writerArea, locLat, locLong, english, hindi, gujarati } = req.body;
		//TODO>save into db
		//phoneNo<int>,name<str>,age<int>,writerCity<str>,writerArea<str>,locLat<int>,locLong<int>,english<bool>,hindi<bool>,gujarati<bool>
		res.send(200);
	}
	catch {
		res.send(500);
	}
});

app.get('/jobsForYou', (req, res) => {
	try {
		//TODO>get all data from db with (acceptedBy==-1), i'm using static test data
		data = [
			{
				"jobID": 1,
				"phoneNo": 123456789,
				"name": "John Doe",
				"age": 20,
				"examName": "abc",
				"examSubject": "math",
				"examLanguageEnglish": true,
				"examLanguageHindi": false,
				"examLanguageGujarati": false,
				"examUNIXTime": 1665190000000,
				"examDuration": 3600000,
				"examCity": 'Ahmedabad',
				"examArea": 'Paldi',
				"examLat": 23.0071622,
				"examLong": 72.5486076,
				"commute": true,
				"acceptedBy": -1
			},
			{
				"jobID": 2,
				"phoneNo": 123456789,
				"name": "John Doe",
				"age": 20,
				"examName": "abc",
				"examSubject": "sci",
				"examLanguageEnglish": true,
				"examLanguageHindi": false,
				"examLanguageGujarati": false,
				"examUNIXTime": 1665190000000,
				"examDuration": 3600000,
				"examCity": 'Ahmedabad',
				"examArea": 'Gita Mandir',
				"examLat": 23.0136641,
				"examLong": 72.5853163,
				"commute": true,
				"acceptedBy": -1
			},
			{
				"jobID": 3,
				"phoneNo": 123456789,
				"name": "John Doe",
				"age": 20,
				"examName": "abc",
				"examSubject": "english",
				"examLanguageEnglish": true,
				"examLanguageHindi": false,
				"examLanguageGujarati": false,
				"examUNIXTime": 1665190000000,
				"examDuration": 3600000,
				"examCity": 'Ahmedabad',
				"examArea": 'Bopal',
				"examLat": 23.0288551,
				"examLong": 72.4493513,
				"commute": true,
				"acceptedBy": -1
			},
			{
				"jobID": 4,
				"phoneNo": 123456789,
				"name": "John Doe",
				"age": 20,
				"examName": "abc",
				"examSubject": "guj",
				"examLanguageEnglish": true,
				"examLanguageHindi": false,
				"examLanguageGujarati": true,
				"examUNIXTime": 1665220000000,
				"examDuration": 3600000,
				"examCity": "Ahmedabad",
				"examArea": "Paldi",
				"examLat": 23.0071622,
				"examLong": 72.5486076,
				"commute": true,
				"acceptedBy": -1
			}
		];

		//TODO>get writer's data from db, i'm using static test data
		writer = {
			"phoneNo": 987654321,
			"name": 'Dohn Joe',
			"age": 35,
			"writerCity": 'Ahmedabad',
			"writerArea": 'Maninagar',
			"locLat": 22.992737,
			"locLong": 72.5868271,
			"english": true,
			"hindi": false,
			"gujarati": false
		};


		var suitableJobs = [];

		for (job in data) {
			if (data[job]["examLanguageEnglish"]) {
				if (!writer["english"]) {
					continue;
				}
			}
			if (data[job]["examLanguageHindi"]) {
				if (!writer["hindi"]) {
					continue;
				}
			}
			if (data[job]["examLanguageGujarati"]) {
				if (!writer["gujarati"]) {
					continue;
				}
			}

			suitableJobs.push(data[job]);
		}

		suitableJobs.sort(function (a, b) {
			var distA = distance(a["examLat"], a["examLong"], writer["locLat"], writer["locLong"])
			var distB = distance(b["examLat"], b["examLong"], writer["locLat"], writer["locLong"])
			if (distA < distB) return -1;
			if (distA > distB) return 1;

			return 0;
		});

		res.send(suitableJobs);
	}
	catch {
		res.send(500);
	}
});


app.get('/jobDetails', (req, res) => {
	try {
		//TODO>get job data from db, i'm using static data for test
		data = {
			"jobID": 2,
			"phoneNo": 123456789,
			"name": "John Doe",
			"age": 20,
			"examName": "abc",
			"examSubject": "sci",
			"examLanguageEnglish": true,
			"examLanguageHindi": false,
			"examLanguageGujarati": false,
			"examUNIXTime": 1665190000000,
			"examDuration": 3600000,
			"examCity": 'Ahmedabad',
			"examArea": 'Gita Mandir',
			"examLat": 23.0136641,
			"examLong": 72.5853163,
			"commute": true,
			"acceptedBy": -1
		};

		res.send(data);
	}
	catch {
		res.send(500);
	}
});

app.post('/acceptRequest', (req, res) => {
	try {
		const { writerPhoneNo, jobID } = req.body;
		//TODO>update (acceptedBy) with writerPhoneNo in (jobID) in db
		res.send(200);
	}
	catch {
		res.send(500);
	}
});

app.get('/acceptedRequests', (req, res) => {
	try {
		//TODO>get job data from db with (phoneNo==user's phoneNo), i'm using static data for test
		data = [{
			"jobID": 2,
			"phoneNo": 123456789,
			"name": "John Doe",
			"age": 20,
			"examName": "abc",
			"examSubject": "sci",
			"examLanguageEnglish": true,
			"examLanguageHindi": false,
			"examLanguageGujarati": false,
			"examUNIXTime": 1665190000000,
			"examDuration": 3600000,
			"examCity": 'Ahmedabad',
			"examArea": 'Gita Mandir',
			"examLat": 23.0136641,
			"examLong": 72.5853163,
			"commute": true,
			"acceptedBy": 987654321
		}];


		out = []

		for (job in data) {
			//TODO>get corresponding user's details from db using (acceptedBy), i'm using static data for test
			writer = {
				"phoneNo": 987654321,
				"name": 'Dohn Joe',
				"age": 35,
				"writerCity": 'Ahmedabad',
				"writerArea": 'Maninagar',
				"locLat": 22.992737,
				"locLong": 72.5868271,
				"english": true,
				"hindi": false,
				"gujarati": false
			};

			writer["jobID"] = data[job]["jobID"];
			writer["examName"] = data[job]["examName"];
			writer["examSubject"] = data[job]["examSubject"];
			out.push(writer);
		}
		res.send(out);
	}
	catch {
		res.send(500);
	}
});


//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::                                                                         :::
//:::  This routine calculates the distance between two points (given the     :::
//:::  latitude/longitude of those points). It is being used to calculate     :::
//:::  the distance between two locations using GeoDataSource (TM) prodducts  :::
//:::                                                                         :::
//:::  Definitions:                                                           :::
//:::    South latitudes are negative, east longitudes are positive           :::
//:::                                                                         :::
//:::  Passed to function:                                                    :::
//:::    lat1, lon1 = Latitude and Longitude of point 1 (in decimal degrees)  :::
//:::    lat2, lon2 = Latitude and Longitude of point 2 (in decimal degrees)  :::
//:::    unit = the unit you desire for results                               :::
//:::           where: 'M' is statute miles (default)                         :::
//:::                  'K' is kilometers                                      :::
//:::                  'N' is nautical miles                                  :::
//:::                                                                         :::
//:::  Worldwide cities and other features databases with latitude longitude  :::
//:::  are available at https://www.geodatasource.com                         :::
//:::                                                                         :::
//:::  For enquiries, please contact sales@geodatasource.com                  :::
//:::                                                                         :::
//:::  Official Web site: https://www.geodatasource.com                       :::
//:::                                                                         :::
//:::               GeoDataSource.com (C) All Rights Reserved 2018            :::
//:::                                                                         :::
//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

function distance(lat1, lon1, lat2, lon2, unit = "K") {
	if ((lat1 == lat2) && (lon1 == lon2)) {
		return 0;
	}
	else {
		var radlat1 = Math.PI * lat1 / 180;
		var radlat2 = Math.PI * lat2 / 180;
		var theta = lon1 - lon2;
		var radtheta = Math.PI * theta / 180;
		var dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);
		if (dist > 1) {
			dist = 1;
		}
		dist = Math.acos(dist);
		dist = dist * 180 / Math.PI;
		dist = dist * 60 * 1.1515;
		if (unit == "K") { dist = dist * 1.609344 }
		if (unit == "N") { dist = dist * 0.8684 }
		return dist;
	}
}

app.listen(3000, () => {
	console.log('Running on port 3000');
});