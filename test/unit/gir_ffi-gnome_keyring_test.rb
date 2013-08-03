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

  describe ".item_create_sync" do
    it "calls Lib.gnome_keyring_item_create_sync with the correct values" do
      body = lambda { |keyring, type, display_name, attributes, secret, update_if_exists, item_id|
        GirFFI::ArgHelper.ptr_to_utf8(keyring).must_equal "foo"
        type.must_equal :generic_secret
        GirFFI::ArgHelper.ptr_to_utf8(display_name).must_equal "bar"
        attributes.must_be_instance_of GnomeKeyring::AttributeList
        GirFFI::ArgHelper.ptr_to_utf8(secret).must_equal "secret-name"
        update_if_exists.must_equal false

        item_id.write_int32 42
        :ok
      }

      GnomeKeyring::Lib.stub :gnome_keyring_item_create_sync, body do
        code, id = GnomeKeyring.item_create_sync("foo",
                                                   :generic_secret,
                                                   "bar",
                                                   [],
                                                   "secret-name",
                                                   false)
        code.must_equal :ok
        id.must_equal 42
      end
    end
  end
end
