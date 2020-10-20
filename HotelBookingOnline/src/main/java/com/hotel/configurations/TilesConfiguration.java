package com.hotel.configurations;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@Configuration
public class TilesConfiguration extends WebMvcConfigurerAdapter{
	@Bean
	public UrlBasedViewResolver urlBasedViewResolver() {
		UrlBasedViewResolver resolver = new UrlBasedViewResolver();
		resolver.setViewClass(TilesView.class);
		return resolver;
	}

	@Bean
	public TilesConfigurer tilesConfigurer() {
		TilesConfigurer configure = new TilesConfigurer();
		configure.setDefinitions(new String[] {
				"/WEB-INF/tiles/tiles_client.xml",
				"/WEB-INF/tiles/tiles_client_user.xml",
				"/WEB-INF/tiles/tiles_client_rooms.xml",
				"/WEB-INF/tiles/tiles_client_booking.xml",
				"/WEB-INF/tiles/tiles_admin.xml",
				"/WEB-INF/tiles/tiles_admin_booking.xml",
				"/WEB-INF/tiles/tiles_admin_room.xml",
				"/WEB-INF/tiles/tiles_admin_service.xml",
				"/WEB-INF/tiles/tiles_admin_staff.xml",
				"/WEB-INF/tiles/tiles_admin_user.xml",
				"/WEB-INF/tiles/tiles_admin_guest.xml",
				"/WEB-INF/tiles/tiles_admin_promotion.xml"
		});
		return configure;
	}
}
