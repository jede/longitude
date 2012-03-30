require 'spec_helper'

describe 'Steps' do
  before :each do
    @css = render """
      @include longitude(2 4 6) {
        p { width: steps(10px 20px); }
      }
    """
  end

  it 'sets width according to the given steps' do
    @css.should include("width: 10px;")
    @css.should include("width: 20px;")
  end

  it 'sets the last value as the default if it is missing' do
    @css.should match(/@media \(min-width: 481px\).* width: 20px;/m)
  end
end
