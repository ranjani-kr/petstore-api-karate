package karate.petstore;

import com.intuit.karate.junit5.Karate;

public class PetstoreTestRunner {
    @Karate.Test
    Karate testAll() {
        return Karate.run("classpath:AddPetToStore.feature");


        //return Karate.run().relativeTo(getClass());
    }
}
