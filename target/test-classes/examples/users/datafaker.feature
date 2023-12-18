Feature:	Gneerate random data using datafaker library

Scenario:	Create simple JSON object - DataFaker

* def dataFaker = Java.type("net.datafaker.Faker")
* def dataFakerObject = new dataFaker()
* def idValue = dataFakerObject.number().randomNumber()
* def fullname =  dataFakerObject.name().fullName()
* def emailValue = fullname + "@gmail.com"


* set jsonObjectPayload
	|	path	|value	|
	|id	|	idValue	|
	|name	|fullname	|
	|email	|emailValue	|
	
* print jsonObjectPayload

Scenario:	Create complex JSON object & JSON array - DataFaker

* def dataFaker = Java.type("net.datafaker.Faker")
* def dataFakerObject = new dataFaker()
* def idValue = dataFakerObject.number().randomNumber()
* def fullname =  dataFakerObject.name().fullName()
* def emailValue = fullname + "@gmail.com"


* set jsonObjectPayload
	|	path	|value	|
	|id	|	idValue	|
	|name	|fullname	|
	|email	|emailValue	|
	|city.name	|	'kolkata'	|
	|city.zip	|	700024	|
	
* print jsonObjectPayload

	Scenario:	Create complex JSON object & JSON array - with custom class

		* def dataFaker = Java.type("utils.RandomDataGenerator")

		* def idValue = dataFaker.getRandomInteger(6)
		* print idValue
		* def fullname = dataFaker.getRandomFullName()
		* print 'full name is ' + fullname
		* def emailValue = dataFaker.getRandomEmail()
		* print emailValue
		* set jsonObjectPayload
			|	path	|value	|
			|id	|	idValue	|
			|name	|fullname	|
			|email	|emailValue	|
			|city.name	|	'kolkata'	|
			|city.zip	|	700024	|

		* print jsonObjectPayload

