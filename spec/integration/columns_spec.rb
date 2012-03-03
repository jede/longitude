require 'spec_helper'

describe 'Columns' do
  describe 'standard column widths' do
    before :each do
      @css = render """
      @include longitude(2 4) {
        p { width: columns(2); }
      }
      """
    end

    it 'calculates width for maxed layout' do
      #two columns 60px each, with two gutter widths of 10px in between
      @css.should include("width: #{60 + 10 + 10 + 60}px;")
    end

    it 'calculates width for 4 column layout' do
      @css.should include("width: #{100.0 * 140/320}%;")
    end

    it 'calculates width for 2 column layout' do
      @css.should include("width: #{100.0 * 140/160}%;")
    end
  end
end
