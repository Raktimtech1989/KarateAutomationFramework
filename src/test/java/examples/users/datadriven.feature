Feature:  Datadriven testing in karate
  Scenario Outline: Basics of data driven for <fn>

    * def firstName = "<fn>"
    * def id = <id>
    * def isManager  = "<manager>"
    * print "Details are "  , firstName , id , isManager
    * match firstName == '#string'

    Examples:
    |fn   |id   |manager    |
    |raktim |1  |true |
  |rahul  |11 |true |
  |sarkar |13 |false  |


    Scenario Outline: Basics of data driven - JSON Payload

      * def randomName = "sarkar"
      * def jsonPayload =
      """
      {
          "firstname" : "<fn>" ,
          "id" : <id> ,
          "isManager" : <manager>
      }
      """
      * print jsonPayload
      * print __row
      * print __num
      Examples:
        |fn   |id !  |manager!    |
        |#(randomName) |1  |true |
        |rahul  |11 |true |
        |sarkar |13 |false  |


  Scenario Outline: Basics of data driven - from external JSON file

    * def jsonPayload =
      """
      {
          "firstname" : "<name>" ,
          "id" : <id> ,
          "isManager" : <isManager>
      }
      """
    * print jsonPayload

    Examples:
      |read('file:src/test/resources/payloads/MOCK_DATA.json')  |

