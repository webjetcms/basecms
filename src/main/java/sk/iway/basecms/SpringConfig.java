package sk.iway.basecms;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * Spring configuration for the Base CMS application
 * https://docs.webjetcms.sk/latest/en/custom-apps/spring-config/
 */

@Configuration("basecmsSpringConfig")
@ComponentScan({
    "sk.iway.basecms",
    "sk.iway.basecms.contact"
})
public class SpringConfig {

}
