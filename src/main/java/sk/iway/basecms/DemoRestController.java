package sk.iway.basecms;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import sk.iway.iwcm.Constants;

@RestController
public class DemoRestController
{
	@GetMapping(path={"/demo-test"})
	public String test()
	{
		return "Demo OK " + Constants.getInstallName();
	}
}