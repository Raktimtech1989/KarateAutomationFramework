package utils;

import net.datafaker.Faker;

public class RandomDataGenerator {

    public static String getRandomInteger(int size)
    {
        Faker faker = new Faker()  ;
        return faker.number().digits(size) ;
    }

    public static String getRandomFullName()
    {
        Faker faker = new Faker()  ;
        return faker.name().fullName() ;
    }
    
    public static String getRandomEmail()
    {
        Faker faker = new Faker()  ;
        String name =  faker.name().fullName() ;
       String email =  name + "@gmail.com" ;
        String finalEmail = email.replaceAll(" +", "") ;
        
        return finalEmail ;
    }
}
