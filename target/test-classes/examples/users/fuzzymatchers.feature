Feature:  Test using Fuzzy Matches
  Scenario: Fuzzy matchers

    * def jo =

    """
    {
       "id" : '123' ,
       "dob" : 1991
    }
    """
    * match jo.id == '123'
    * match jo.id == '#string'
    * match jo.id == '#present'

    * match jo.id == '#regex \\d{3}'
    * match (jo.dob + "") == '#regex \\d{4}'


    Scenario: Fuzzy macthes - 2

      * def jo =
      """
      {
         "id" : 12 ,
         "name" : "raktim" ,
         "isManager" : true ,
         "skills" : [
             "java" ,
             "testing"
         ]
      }
      """

      * match jo.skills == '#array'
      * match jo.skills == '#[2]'
      * match jo.skills == '#? _[0] ==  "java"'

