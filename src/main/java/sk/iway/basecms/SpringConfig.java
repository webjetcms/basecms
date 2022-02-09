package sk.iway.basecms;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan({
    "sk.iway.basecms",
    "sk.iway.basecms.contact"
})
public class SpringConfig {

}
