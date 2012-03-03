require 'spec_helper'

describe 'Gutters' do
  describe 'function' do
    before :each do
      @css = render """
      @include longitude(2 4) {
        p { margin: 0 gutter(); }
      }
      """
    end

    it 'calculates correct gutter value for max layout' do
      @css.should include("margin: 0 10px")
    end

    it 'calculates correct gutter value for 4 column layout' do
      @css.should include("margin: 0 #{100.0 * 10/320}%")
    end

    it 'calculates correct gutter value for 2 column layout' do
      @css.should include("margin: 0 #{100.0 * 10/160}%")
    end
  end

  describe 'mixin' do
    before :each do
      @css = render """
      @include longitude(2 4) {
        p { @include gutters; }
      }
      """
    end

    it 'calculates correct gutter value for max layout' do
      @css.should include("margin-left: 10px")
      @css.should include("margin-right: 10px")
    end

    it 'calculates correct gutter value for 4 column layout' do
      gutter = 100.0 * 10/320
      @css.should include("margin-left: #{gutter}%")
      @css.should include("margin-right: #{gutter}%")
    end

    it 'calculates correct gutter value for 2 column layout' do
      gutter = 100.0 * 10/160
      @css.should include("margin-left: #{gutter}%")
      @css.should include("margin-right: #{gutter}%")
    end
  end
end
