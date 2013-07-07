require 'test_helper'

describe GnomeKeyring::AttributeList do
  it "descends from GLib::Array" do
    GnomeKeyring::AttributeList.ancestors.must_include GLib::Array
  end
  describe "#new" do
    it "takes no arguments" do
      GnomeKeyring::AttributeList.new
      pass
    end
  end
end
