require 'test_helper'

describe GnomeKeyring::AttributeList do
  it "descends from GLib::Array" do
    GnomeKeyring::AttributeList.ancestors.must_include GLib::Array
  end

  describe ".new" do
    it "takes no arguments" do
      GnomeKeyring::AttributeList.new
      pass
    end
  end

  describe "#append_string" do
    it "appends a string attribute" do
      list = GnomeKeyring::AttributeList.new
      list.append_string 'foo', 'bar'
      attr = list.index(0)
      attr.name.must_equal 'foo'
      attr.get_string.must_equal 'bar'
      attr.type.must_equal :string
    end
  end
end
