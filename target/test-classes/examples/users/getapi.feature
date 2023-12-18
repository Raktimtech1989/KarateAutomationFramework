Feature:	GET API Feature

Scenario: get user details

Given url baseUrl
When method GET
Then status 200
* print response
* def jsonResponse = response
* print jsonResponse
* def actName = jsonResponse.data[0].last_name
* print actName
* match actName == 'Lawson'


Scenario: get user details user not found

Given url baseUrl
When method GET
Then status 200