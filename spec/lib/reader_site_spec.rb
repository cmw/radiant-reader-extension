require File.dirname(__FILE__) + "/../spec_helper"

if defined? Site
  describe 'Reader-extended site' do
    dataset :reader_layouts
    Radiant::Config['reader.layout'] = 'This one'

    it "should have a reader_layout association" do
      Site.reflect_on_association(:reader_layout).should_not be_nil
    end
    
    it "should return no layout by default" do
      sites(:mysite).layout_for(:reader).should be_nil
    end
    
    it "should be able to set its own layout" do
      site = sites(:mysite)
      site.reader_layout = layouts(:other)
      site.layout_for(:reader).should == 'Other'
    end
  end
end