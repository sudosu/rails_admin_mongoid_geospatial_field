module RailsAdmin::Config::Fields::Types
  class Geospatial < RailsAdmin::Config::Fields::Base
    RailsAdmin::Config::Fields::Types::register(:geospatial, self)

    # THe name of the corresponding longitude field to match the latitude field
    # in this object.
    register_instance_option(:longitude_field) do
      "longitude"
    end

    register_instance_option(:address_field) do
      "address"
    end

    register_instance_option(:country_field) do
      "country"
    end

    register_instance_option(:city_field) do
      "city"
    end

    register_instance_option(:state_field) do
      "state"
    end

    register_instance_option(:partial) do
      :form_geospatial
    end

    # Google Maps API Key - optional
    register_instance_option(:google_api_key) do
      nil
    end

    # Latitude value to display in the map if the latitude attribute is nil
    register_instance_option(:default_latitude) do
      40.711417 # Latitude of Jersey City, NJ
    end

    # Longitude value to display if the longitude attribute is nil
    register_instance_option(:default_longitude) do
      -74.0647 # Longitude of Jersey City, NJ
    end

    # Default zoom level of the map
    register_instance_option(:default_zoom_level) do
      8
    end

    # Map heigth in px
    register_instance_option(:map_width) do
      300
    end

    # Map width in px
    register_instance_option(:map_height) do
      200
    end

    def sanitized_object_name(object_name)
      object_name.gsub(/]\[|[^-a-zA-Z0-9:.]/,"_").sub(/_$/,"")
    end

    def form_tag_id(object_name, field)
      "#{sanitized_object_name(object_name.to_s)}_#{field.to_s}"
    end

    def dom_name
      @dom_name ||= "#{form_tag_id(bindings[:form].object_name, @name)}"
    end

    def latitude_dom_name
      form_tag_id(bindings[:form].object_name, @name) + '_latitude'
    end

    def longitude_dom_name
      form_tag_id(bindings[:form].object_name, longitude_field) + '_longitude'
    end

    def address_dom_name
      form_tag_id(bindings[:form].object_name, address_field)
    end

    def country_dom_name
      form_tag_id(bindings[:form].object_name, country_field)
    end

    def city_dom_name
      form_tag_id(bindings[:form].object_name, city_field)
    end

    def state_dom_name
      form_tag_id(bindings[:form].object_name, state_field)
    end
  end
end
