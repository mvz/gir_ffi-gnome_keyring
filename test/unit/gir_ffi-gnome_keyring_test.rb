require 'test_helper'

describe GnomeKeyring do
  describe '.find_items_sync' do
    it 'calls Lib.gnome_keyring_find_items_sync with the correct values' do
      body = lambda { |type, attrs, listptr|
        type.must_equal :generic_secret
        attrs.must_be_instance_of GnomeKeyring::AttributeList
        listptr.must_be_instance_of FFI::MemoryPointer
        :ok
      }

      GnomeKeyring::Lib.stub :gnome_keyring_find_items_sync, body do
        code, list = GnomeKeyring.find_items_sync :generic_secret, []
        code.must_equal :ok
        list.must_be_nil
      end
    end
  end

  describe '.item_create_sync' do
    it 'calls Lib.gnome_keyring_item_create_sync with the correct values' do
      body = lambda { |keyring, type, display_name, attributes, secret, update_if_exists, item_id|
        keyring.to_utf8.must_equal 'foo'
        type.must_equal :generic_secret
        display_name.to_utf8.must_equal 'bar'
        attributes.must_be_instance_of GnomeKeyring::AttributeList
        secret.to_utf8.must_equal 'secret-name'
        update_if_exists.must_equal false

        item_id.put_int32 0, 42
        :ok
      }

      GnomeKeyring::Lib.stub :gnome_keyring_item_create_sync, body do
        code, id = GnomeKeyring.item_create_sync('foo',
                                                 :generic_secret,
                                                 'bar',
                                                 [],
                                                 'secret-name',
                                                 false)
        code.must_equal :ok
        id.must_equal 42
      end
    end
  end

  describe '.item_get_attributes_sync' do
    it 'calls Lib.gnome_keyring_item_get_attributes_sync with the correct values' do
      body = lambda { |keyring, id, attributes|
        keyring.to_utf8.must_equal 'foo'
        id.must_equal 42
        attributes.must_be_instance_of FFI::MemoryPointer
        :ok
      }

      GnomeKeyring::Lib.stub :gnome_keyring_item_get_attributes_sync, body do
        code, list = GnomeKeyring.item_get_attributes_sync 'foo', 42
        code.must_equal :ok
        list.must_be_nil
      end
    end
  end

  describe '.item_set_attributes_sync' do
    it 'calls Lib.gnome_keyring_item_set_attributes_sync with the correct values' do
      body = lambda { |keyring, id, attributes|
        keyring.to_utf8.must_equal 'foo'
        id.must_equal 42
        attributes.must_be_instance_of GnomeKeyring::AttributeList
        :ok
      }

      GnomeKeyring::Lib.stub :gnome_keyring_item_set_attributes_sync, body do
        result = GnomeKeyring.item_set_attributes_sync 'foo', 42, []
        result.must_equal :ok
      end
    end
  end
end
