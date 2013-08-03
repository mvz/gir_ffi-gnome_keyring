require 'test_helper'

describe GnomeKeyring do
  describe ".find_items_sync" do
    it "returns a tuple of result code and result list" do
      code, list = GnomeKeyring.find_items_sync :generic_secret, []
      code.must_equal :ok
      list.element_type.must_equal GnomeKeyring::Found
    end
  end
end
