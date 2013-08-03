require 'test_helper'

describe GnomeKeyring do
  describe ".find_items_sync" do
    it "calls Lib.gnome_keyring_find_items_sync with the correct values" do
      body = lambda { |type, attrs, listptr|
        type.must_equal :generic_secret
        attrs.must_be_instance_of GnomeKeyring::AttributeList
        listptr.must_be_instance_of GirFFI::InOutPointer
        :ok
      }

      GnomeKeyring::Lib.stub :gnome_keyring_find_items_sync, body do
        code, list = GnomeKeyring.find_items_sync :generic_secret, []
        code.must_equal :ok
        list.must_be_nil
      end
    end
  end
end
