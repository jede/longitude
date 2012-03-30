require 'spec_helper'

describe 'Steps' do
  before :each do
    @css = render """
      @include longitude(2 4) {
        p { width: steps(10px 20px); }
      }
    """
  end

  it 'sets width according to the given steps' do
    @css.should include("width: 10px;")
  end

  it 'sets width according to the given steps' do
    @css.should include("width: 20px;")
  end
end
