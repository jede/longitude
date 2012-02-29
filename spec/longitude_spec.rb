require 'spec_helper'
require 'sass'
require 'longitude'

describe 'Longitude' do
  it 'works' do
    template = """
    @import 'longitude';

    @include longitude(2 4) {
      h1 { color: blue; }
    }
    """
    sass_engine = Sass::Engine.new(template, syntax: :scss)
    output = sass_engine.render
    output.should include('h1')
  end
end
