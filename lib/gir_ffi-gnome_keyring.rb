require 'gir_ffi'

GirFFI.setup 'GnomeKeyring'

require 'gir_ffi-gnome_keyring/attribute'
require 'gir_ffi-gnome_keyring/attribute_list'
require 'gir_ffi-gnome_keyring/found'

module GnomeKeyring
  setup_method :find_items_sync
  setup_method :item_create_sync
  setup_method :item_get_attributes_sync
  setup_method :item_set_attributes_sync

  class << self
    remove_method :find_items_sync
    remove_method :item_create_sync
    remove_method :item_set_attributes_sync
    remove_method :item_get_attributes_sync
  end

  def self.find_items_sync(type, attributes)
    v2 = GnomeKeyring::AttributeList.from(attributes)
    v3 = FFI::MemoryPointer.new :pointer
    v4 = GnomeKeyring::Lib.gnome_keyring_find_items_sync(type, v2, v3)
    v5 = GLib::List.wrap(GnomeKeyring::Found, v3.get_pointer(0))
    [v4, v5]
  end

  def self.item_create_sync(keyring, type, display_name, attributes, secret,
                            update_if_exists)
    v1 = GirFFI::InPointer.from_utf8(keyring)
    v3 = GirFFI::InPointer.from_utf8(display_name)
    v4 = GnomeKeyring::AttributeList.from(attributes)
    v5 = GirFFI::InPointer.from_utf8(secret)
    v7 = FFI::MemoryPointer.new :uint32
    v8 = GnomeKeyring::Lib.gnome_keyring_item_create_sync(v1, type, v3, v4,
                                                          v5,
                                                          update_if_exists,
                                                          v7)
    v9 = v7.get_uint32(0)
    [v8, v9]
  end

  def self.item_get_attributes_sync(keyring, id)
    v1 = GirFFI::InPointer.from_utf8(keyring)
    v3 = FFI::MemoryPointer.new :pointer
    v4 = GnomeKeyring::Lib.gnome_keyring_item_get_attributes_sync(v1, id, v3)
    attributes = GnomeKeyring::AttributeList.wrap(v3.get_pointer(0))
    [v4, attributes]
  end

  def self.item_set_attributes_sync(keyring, id, attributes)
    v1 = GirFFI::InPointer.from_utf8(keyring)
    v3 = GnomeKeyring::AttributeList.from(attributes)
    GnomeKeyring::Lib.gnome_keyring_item_set_attributes_sync(v1, id, v3)
  end
end
