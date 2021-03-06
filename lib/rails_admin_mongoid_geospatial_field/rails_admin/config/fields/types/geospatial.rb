module RailsAdmin::Config::Fields::Types
  class Geospatial < RailsAdmin::Config::Fields::Base
    RailsAdmin::Config::Fields::Types::register(:geospatial, self)

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

    # Initial latitude value
    register_instance_option(:default_latitude) do
      48.9226 # Latitude of Ivano-Frankivs'k, Ukraine
    end

    # Initial longitude value
    register_instance_option(:default_longitude) do
      24.7111 # Longitude of Ivano-Frankivs'k, Ukraine
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
      form_tag_id(bindings[:form].object_name, @name) + '_longitude'
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
