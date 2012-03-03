require 'spec_helper'

describe 'Full width' do
  describe 'and outer gutters' do
    before :each do
      @css = render """
      @include longitude(2 4) {
        p { width: full-width(); }
      }
      """
    end

    it 'calculates for maxed layout' do
      @css.should include("width: 320px;")
    end

    it 'calculates width for 4 column layout' do
      @css.should include("width: 100%;")
    end

    it 'calculates width for 2 column layout' do
      @css.should include("width: 100%;")
    end
  end

  describe 'no outer gutters' do
    before :each do
      @css = render """
      @include longitude(2 4) {
        p { width: full-width($outer-gutters: false); }
      }
      """
    end

    it 'calculates for maxed layout' do
      @css.should include("width: 300px;")
    end

    it 'calculates width for 4 column layout' do
      @css.should include("width: #{100 - 100.0 * 20/320}%;")
    end

    it 'calculates width for 2 column layout' do
      @css.should include("width: #{100 - 100.0 * 20/160}%;")
    end
  end
end
