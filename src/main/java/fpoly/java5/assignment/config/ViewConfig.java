package fpoly.java5.assignment.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

import java.util.Arrays;

@Configuration
@ConfigurationProperties(prefix = "spring.custom-view")
public class ViewConfig {

    private String[] locationTilesDefinitions;

    public void setLocationTilesDefinitions(String...locationTilesDefinitions) {
        this.locationTilesDefinitions = locationTilesDefinitions;
    }


    @Bean
    public ViewResolver viewResolver() {
        TilesViewResolver tilesViewResolver = new TilesViewResolver();
        return tilesViewResolver;
    }

    @Bean
    public TilesConfigurer tilesConfigurer() {
        TilesConfigurer tilesConfigurer = new TilesConfigurer();
        tilesConfigurer.setDefinitions(locationTilesDefinitions);
        return tilesConfigurer;
    }


}
