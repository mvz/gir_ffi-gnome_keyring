# frozen_string_literal: true

require "test_helper"

describe GnomeKeyring::AttributeList do
  it "descends from GLib::Array" do
    _(GnomeKeyring::AttributeList.ancestors).must_include GLib::Array
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
      _(copy.to_ptr).must_equal orig.to_ptr
    end
  end

  describe ".from" do
    it "wraps its argument's pointer in an AttributeList object" do
      orig = GnomeKeyring::AttributeList.new
      copy = GnomeKeyring::AttributeList.from(orig)
      _(copy.to_ptr).must_equal orig.to_ptr
    end

    it "wraps an empty array" do
      attr = GnomeKeyring::AttributeList.from([])
      _(attr.to_a).must_equal []
    end

    it "wraps an array of Attribute" do
      att = GnomeKeyring::Attribute.new
      att.name = "foo"
      attr = GnomeKeyring::AttributeList.from([att])
      arr = attr.to_a
      _(arr.length).must_equal 1
      _(arr.first.name).must_equal "foo"
    end
  end

  describe "#append_string" do
    it "appends a string attribute" do
      list = GnomeKeyring::AttributeList.new
      list.append_string "foo", "bar"
      attr = list.index(0)
      _(attr.name).must_equal "foo"
      _(attr.get_string).must_equal "bar"
      _(attr.type).must_equal :string
    end
  end

  describe "#append_uint32" do
    it "appends a uint32 attribute" do
      list = GnomeKeyring::AttributeList.new
      list.append_uint32 "baz", 42
      attr = list.index(0)
      _(attr.name).must_equal "baz"
      _(attr.get_uint32).must_equal 42
      _(attr.type).must_equal :uint32
    end
  end
end
