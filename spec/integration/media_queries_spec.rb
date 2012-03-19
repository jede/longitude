require 'spec_helper'

describe 'Media queries' do
  describe 'standard column widths' do
    before :each do
      @css = render """
      @include longitude(2 4) {
        p { color: blue; }
      }
      """
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

  describe 'custom column widths' do
    before :each do
      @css = render """
      $longitude-gutter-width: 5px;
      $longitude-column-width: 10px;

      @include longitude(2 4) {
        p { color: blue; }
      }
      """
    end

    it 'renders the middle stop according to the custom widths' do
      @css.should include('@media (min-width: 41px) and (max-width: 80px)')
    end
  end

  describe 'fluidity check' do
    before :each do
      @css = render """
      @include longitude(4) {
        p { 
          @if not is-fluid() {
            color: blue;
          }
        }
      }
      """
    end

    it 'should only render "color: blue" for the higher bound media query' do
      @css.should match(/@media \(min-width: 321px\).*color: blue;/m)
    end
  end
end
