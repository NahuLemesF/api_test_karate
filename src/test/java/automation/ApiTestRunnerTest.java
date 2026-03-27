package automation;

import com.intuit.karate.junit5.Karate;

class ApiTestRunnerTest {

    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }
}
