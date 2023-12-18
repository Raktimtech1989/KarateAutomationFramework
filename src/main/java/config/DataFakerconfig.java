package config;

import net.datafaker.Faker;

public class DataFakerconfig {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
        Faker faker = new Faker() ;
        System.out.println(faker.number().randomNumber());
        String name = faker.name().fullName() ;
        String email = name + "@gmail.com" ;
        
        System.out.println("email is  "  + email);

	}

}
