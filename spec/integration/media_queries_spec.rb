require 'spec_helper'
require 'sass'
require 'longitude'

describe 'Media queries' do
  describe 'standard columns' do
    before :each do
      template = """
      @import 'longitude';

      @include longitude(2 4) {
        p { color: blue; }
      }
      """
      sass_engine = Sass::Engine.new(template, syntax: :scss)
      @css = sass_engine.render
    end

    it 'includes lower bound' do
      @css.should include('@media (max-width: 160px)')
    end

    it 'includes the middle step' do
      @css.should include('@media (min-width: 161px) and (max-width: 320px)')
    end

    it 'includes the higher bound' do
      @css.should include('@media (min-width: 321px)')
    end
  end
end
