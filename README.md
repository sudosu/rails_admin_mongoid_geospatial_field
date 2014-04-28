# Rails Admin Mongoid Geospatial Field:

Adds to [RailsAdmin](https://github.com/sferik/rails_admin) support for setting geospatial information with Google Maps.

## Installation

To enable this gem, add the following to your `Gemfile`:

```ruby
gem "rails_admin_mongoid_geospatial_field", :github => "sudosu/rails_admin_mongoid_geospatial_field"
```

And then execute:

    $ bundle

## Usage

In your model location field must be an Array:

```ruby
class Person
  include Mongoid::Document
  field :location, :type => Array  # [lat,lng]
  index( { location: '2d' }, { min: -180, max: 180 })
end
```

Then, add in your `config/initializers/rails_admin.rb` initializer:

```ruby
RailsAdmin.config do |config|
  config.model Person do
    edit do
      field :location, :geospatial
    end
  end
end
```

## Configuration

- `google_api_key` - if you use a Google Maps API Key, it can be specified here.
- `default_latitude` - the latitude to center the map shown on if the latitude is blank. Defaults to 48.9226, the latitude of Ivano-Frankivs'k City, Ukraine
- `default_longitude` - the longitude used if the longitude is blank. Defaults to 24.7111, the longitude of Ivano-Frankivs'k City, Ukraine.
- `default_zoom_level` - initial map zoom level. Defaults to 8
- `map_width` - map width in px, eg: '400'
- `map_height` - map height in px

If your model have an additional address fields (city, country, state), you can configure field for geocoding them:
- `address_field` - the name of the address field. Defaults to :address
- `city_field` - the name of the city field. Defaults to :city
- `state_field` - the name of the state field. Defaults to :state
- `country_field` - the name of the country field. Defaults to :country
This works perfectly even with associations.

Example:

```ruby
RailsAdmin.config do |config|
  config.model Point do
    edit do
      field :location, :geospatial do
        address_field :address
        google_api_key "a1b2c3d4e5f6deadbeef"
        default_latitude 50.4  # Kiev, Ukraine
        default_longitude 30.5
        default_zoom_level 15
      end
    end
  end
end
```

## License

Licensed under the MIT license.

Copyright (C) 2014 Oleg Popadyuk

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
