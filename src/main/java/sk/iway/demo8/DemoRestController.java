package sk.iway.demo8;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import sk.iway.iwcm.Constants;

@RestController
public class DemoRestController
{		
	@RequestMapping(path={"/demo-test"},method = RequestMethod.GET)
	public String test()
	{
		return "Demo OK " + Constants.getInstallName();
	}
}