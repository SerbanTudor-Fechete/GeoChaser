package com.example.demo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.thymeleaf.spring6.SpringTemplateEngine;
import org.thymeleaf.spring6.templateresolver.SpringResourceTemplateResolver;
import org.thymeleaf.spring6.view.ThymeleafViewResolver;

@Configuration
public class ThymeleafConfig {

    // Template resolver: where Thymeleaf looks for templates.
    @Bean
    public SpringResourceTemplateResolver templateResolver() {
        SpringResourceTemplateResolver templateResolver = new SpringResourceTemplateResolver();
        // This tells Thymeleaf to look in src/main/resources/templates
        templateResolver.setPrefix("classpath:/templates/");
        // Expect files with .html extension
        templateResolver.setSuffix(".html");
        // Use HTML mode (can be changed if needed)
        templateResolver.setTemplateMode("HTML");
        // Ensure the proper character encoding
        templateResolver.setCharacterEncoding("UTF-8");
        // Disable cache for development; in production you may enable caching.
        templateResolver.setCacheable(false);
        return templateResolver;
    }

    // Template engine: combines the template resolver and other settings.
    @Bean
    public SpringTemplateEngine templateEngine(SpringResourceTemplateResolver templateResolver) {
        SpringTemplateEngine engine = new SpringTemplateEngine();
        engine.setTemplateResolver(templateResolver);
        return engine;
    }

    // View resolver: this resolves view names to Thymeleaf templates.
    @Bean
    public ThymeleafViewResolver thymeleafViewResolver(SpringTemplateEngine templateEngine) {
        ThymeleafViewResolver viewResolver = new ThymeleafViewResolver();
        viewResolver.setTemplateEngine(templateEngine);
        viewResolver.setCharacterEncoding("UTF-8");
        return viewResolver;
    }
}
