require 'spec_helper'

describe 'Steps' do
  describe 'with all columns' do
    before :each do
      @css = render """
      @include longitude(2 4) {
        p { width: steps(10px 20px 30px); }
      }
      """
    end

    it 'sets width according to the given steps' do
      @css.should include("width: 10px;")
      @css.should include("width: 20px;")
      @css.should include("width: 30px;")
    end
  end

  describe 'with to few columns' do
    before :each do
      @css = render """
      @include longitude(2 4 6) {
        p { width: steps(10px 20px); }
      }
      """
    end

    it 'sets the last value as the default if it is missing' do
      @css.should match(/@media \(min-width: 481px\).* width: 20px;/m)
    end
  end
end
