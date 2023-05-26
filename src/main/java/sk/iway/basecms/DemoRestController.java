package sk.iway.basecms;

import java.util.random.RandomGeneratorFactory;
import java.util.stream.IntStream;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import sk.iway.iwcm.Constants;

/**
 * Ukazkovy RESR controller
 */

@RestController
public class DemoRestController
{
	@GetMapping(path={"/demo-test"})
	public String test()
	{
		//https://www.baeldung.com/java-17-new-features
		IntStream random = RandomGeneratorFactory.of("Random")
				.create()
				.ints(10, 0, 100);

		return "Demo OK " + Constants.getInstallName() + " " + random.findFirst().getAsInt();
	}
}