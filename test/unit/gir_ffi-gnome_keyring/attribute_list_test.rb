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

  describe ".wrap" do
    it "wraps its argument in an AttributeList object" do
      orig = GnomeKeyring::AttributeList.new
      copy = GnomeKeyring::AttributeList.wrap(orig.to_ptr)
      orig.to_ptr.must_equal copy.to_ptr
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

  describe "#append_uint32" do
    it "appends a uint32 attribute" do
      list = GnomeKeyring::AttributeList.new
      list.append_uint32 'baz', 42
      attr = list.index(0)
      attr.name.must_equal 'baz'
      attr.get_uint32.must_equal 42
      attr.type.must_equal :uint32
    end
  end
end
