module SpacesHelper

	def surface(surface)
		"#{surface}m²"
	end

	def rent_options(space)
		return t('space.unavailable') if !space.available || space.rent_options.blank?
		return t('space.rent_options', options: space.rent_options.map{ |o| t("space.rent_option.#{o}") }. join(" i "))
	end
end