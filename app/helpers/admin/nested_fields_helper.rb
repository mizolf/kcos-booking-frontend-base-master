module Admin::NestedFieldsHelper

  def link_to_add_fields(name, f, assoc, options={})
    new_o=f.object.send(assoc).klass.new
    id=new_o.object_id
    fields=f.fields_for(assoc,new_o,child_index: id) do |ff|
      render(assoc.to_s.singularize+"_fields",f: ff)
    end
    link_to name, "#", class: "add_nested_fields #{options[:custom_classes]}", data: {id: id, fields: fields.gsub("\n","")}
  end

  def multiple_images_upload(f, assoc)
    new_o=f.object.send(assoc).klass.new
    id=new_o.object_id
    fields=f.fields_for(assoc,new_o,child_index: id) do |ff|
        render(assoc.to_s.singularize+"_fields",f: ff)
    end
    file_field_tag :image, accept: 'image/png,image/gif,image/jpeg', :multiple => true, class: "input--image-file js-multiple-images", data: {id: id, fields: fields.gsub("\n","")}, onchange: "nestedImageFields(this)"
  end

end