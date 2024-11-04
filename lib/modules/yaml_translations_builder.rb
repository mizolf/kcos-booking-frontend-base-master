module YamlTranslationsBuilder

	def self.build_attributes_placeholders
		models = ActiveRecord::Base.connection.tables.map { |model| model.capitalize.singularize.camelize } - ["SchemaMigration", "ArInternalMetadatum"]
		open('tmp/test.yml', 'w') { |f|
			models_collection = {}
			models.each do |model|
				# Trying to write errors
				# eval("(#{model}.new.attributes.keys.reject { |att| att.end_with?('_id') }  - ['created_at', 'updated_at', 'id']).each do |key|
				# 		print key
				# 		puts #{model}.validators_on(key).map{|v| v.kind}
				# 	end")
				
				eval("models_collection['#{model.underscore}'] = {}")
				attribs = (eval("#{model}.new.attributes.keys") - ["created_at", "updated_at", "id"]).reject { |att| att.end_with?("_id") }
				attribs.each do |att|
					eval("models_collection['#{model.underscore}'].merge!(#{att}: '')")
				end
			end
			models_collection = models_collection.to_a.reject { |model| model[1].blank? }
			models_collection = {activerecord: {attributes: models_collection.to_h}}
			f.puts models_collection.to_yaml
		}
		YamlTranslationsBuilder.fix_yml("tmp/test.yml")
	end

	def self.fix_yml(file)
		data = File.read(file) 
		filtered_data = data.gsub(/ :/, " ").gsub(/\n:/, "\n").gsub("---\n", "")
		File.open(file, "w") do |f|
		  f.write(filtered_data)
		end
	end

end