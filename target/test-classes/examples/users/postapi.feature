Feature:	Create API using POST http

Background:	
  * url 'https://gorest.co.in'
  * def dataFaker = Java.type("net.datafaker.Faker")
* def dataFakerObject = new dataFaker()
* def idValue = dataFakerObject.number().randomNumber()
* def fullname =  dataFakerObject.name().fullName()
* def emailValue = fullname + "@gmail.com"
* def finalEmail = emailValue.replace(/\s+/g, "") 
* print finalEmail

* def requestPayload = 
 """
  	{
    "gender" : "male" ,
    "status" : "active"
    }

"""
* set requestPayload.name = fullname
* set requestPayload.email = finalEmail
* print requestPayload
 
 
 Scenario:	Create a user with the given data 

  Given	path 'public/v2/users'
  And request requestPayload
  And header Authorization = 'Bearer ' + tokenID
  When method POST
  Then status 201
  And match response.id == '#present'
  * def userID = response.id
  * print userID
  
 * def requestPutPayload = 
 """
  	{
    "gender" : "female" ,
    "status" : "active"
    }

"""

  Given	path 'public/v2/users/' + userID
  And request requestPutPayload
  And header Authorization = 'Bearer ' + tokenID
  When method POST
  Then status 404
