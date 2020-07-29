# frozen_string_literal: true

require "test_helper"

describe GnomeKeyring do
  describe ".find_items_sync" do
    it "calls Lib.gnome_keyring_find_items_sync with the correct values" do
      body = lambda { |type, attrs, listptr|
        _(type).must_equal :generic_secret
        _(attrs).must_be_instance_of GnomeKeyring::AttributeList
        _(listptr).must_be_instance_of FFI::MemoryPointer
        :ok
      }

      GnomeKeyring::Lib.stub :gnome_keyring_find_items_sync, body do
        code, list = GnomeKeyring.find_items_sync :generic_secret, []
        _(code).must_equal :ok
        _(list).must_be_nil
      end
    end
  end

  describe ".item_create_sync" do
    it "calls Lib.gnome_keyring_item_create_sync with the correct values" do
      body =
        lambda { |keyring, type, display_name, attributes, secret, update_if_exists, item_id|
          _(keyring.to_utf8).must_equal "foo"
          _(type).must_equal :generic_secret
          _(display_name.to_utf8).must_equal "bar"
          _(attributes).must_be_instance_of GnomeKeyring::AttributeList
          _(secret.to_utf8).must_equal "secret-name"
          _(update_if_exists).must_equal false

          item_id.put_int32 0, 42
          :ok
        }

      GnomeKeyring::Lib.stub :gnome_keyring_item_create_sync, body do
        code, id = GnomeKeyring.item_create_sync("foo",
                                                 :generic_secret,
                                                 "bar",
                                                 [],
                                                 "secret-name",
                                                 false)
        _(code).must_equal :ok
        _(id).must_equal 42
      end
    end
  end

  describe ".item_get_attributes_sync" do
    it "calls Lib.gnome_keyring_item_get_attributes_sync with the correct values" do
      body = lambda { |keyring, id, attributes|
        _(keyring.to_utf8).must_equal "foo"
        _(id).must_equal 42
        _(attributes).must_be_instance_of FFI::MemoryPointer
        :ok
      }

      GnomeKeyring::Lib.stub :gnome_keyring_item_get_attributes_sync, body do
        code, list = GnomeKeyring.item_get_attributes_sync "foo", 42
        _(code).must_equal :ok
        _(list).must_be_nil
      end
    end
  end

  describe ".item_set_attributes_sync" do
    it "calls Lib.gnome_keyring_item_set_attributes_sync with the correct values" do
      body = lambda { |keyring, id, attributes|
        _(keyring.to_utf8).must_equal "foo"
        _(id).must_equal 42
        _(attributes).must_be_instance_of GnomeKeyring::AttributeList
        :ok
      }

      GnomeKeyring::Lib.stub :gnome_keyring_item_set_attributes_sync, body do
        result = GnomeKeyring.item_set_attributes_sync "foo", 42, []
        _(result).must_equal :ok
      end
    end
  end
end
