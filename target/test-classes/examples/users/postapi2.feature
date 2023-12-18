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
  
  Scenario:	Create a user with the given data 

  Given	path 'public/v2/users'
  And request 
   """
  	{
    "name" : 'raktim',
    "email" : "rs54sessehhsssfxsxfs646@gmail.com" ,
    "gender" : "male" ,
    "status" : "active"
    }

"""
  And header Authorization = 'Bearer ' + tokenID
  When method POST
  Then status 201
  And match response.id == '#present'
  

  
  Scenario:	Create a user with json payload dynamic

  Given	path 'public/v2/users'
  * def requestPayload = {}
  * requestPayload.name = fullname
  * requestPayload.email = finalEmail , requestPayload.gender = "male" ,requestPayload.status = "active"
  
  And request requestPayload
  And header Authorization = 'Bearer ' + tokenID
  When method POST
  Then status 201
  And match response.id == '#present'
  And match $.name == '#present'
  

  
  Scenario:	Create a user with external json file

  Given	path 'public/v2/users'
  * def requestPayload = read('file:src/test/resources/payloads/jsonpayload.json')
  
  * set requestPayload.name = fullname
  * set requestPayload.email = finalEmail
  * print requestPayload
  And request requestPayload
  And header Authorization = 'Bearer ' + tokenID
  When method POST
  Then status 201
  And match response.id == '#present'