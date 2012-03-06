require 'spec_helper'

describe 'Compatibility mode' do
  before :each do
    @css = render """
      $longitude-compatibility-mode: true;

      @include longitude(2 4) {
        p { width: columns(2); }
      }
    """
  end

  it 'disables media queries' do
    @css.should_not include('@media')
  end

  it 'renders pixels' do
    @css.should include('width: 140px;')
  end
end
