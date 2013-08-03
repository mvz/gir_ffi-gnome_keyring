require 'gir_ffi'

GirFFI.setup 'GnomeKeyring'

require 'gir_ffi-gnome_keyring/attribute'
require 'gir_ffi-gnome_keyring/attribute_list'
require 'gir_ffi-gnome_keyring/found'

module GnomeKeyring
  setup_method :find_items_sync
  setup_method :item_create_sync
  setup_method :item_set_attributes_sync

  class << self
    remove_method :find_items_sync
    remove_method :item_create_sync
    remove_method :item_set_attributes_sync
  end

  def self.find_items_sync(type, attributes)
    _v2 = GnomeKeyring::AttributeList.from(attributes)
    _v3 = GirFFI::InOutPointer.for(:glist)
    _v4 = GnomeKeyring::Lib.gnome_keyring_find_items_sync(type, _v2, _v3)
    _v5 = GLib::List.wrap(GnomeKeyring::Found, _v3.to_value)
    return [_v4, _v5]
  end

  def self.item_create_sync(keyring, type, display_name, attributes, secret,
                            update_if_exists)
    _v1 = GirFFI::InPointer.from(:utf8, keyring)
    _v3 = GirFFI::InPointer.from(:utf8, display_name)
    _v4 = GnomeKeyring::AttributeList.from(attributes)
    _v5 = GirFFI::InPointer.from(:utf8, secret)
    _v7 = GirFFI::InOutPointer.for(:guint32)
    _v8 = GnomeKeyring::Lib.gnome_keyring_item_create_sync(_v1, type, _v3, _v4,
                                                           _v5,
                                                           update_if_exists,
                                                           _v7)
    return [_v8, _v7.to_value]
  end

  def self.item_set_attributes_sync(keyring, id, attributes)
    _v1 = GirFFI::InPointer.from(:utf8, keyring)
    _v3 = GnomeKeyring::AttributeList.from(attributes)
    GnomeKeyring::Lib.gnome_keyring_item_set_attributes_sync(_v1, id, _v3)
  end
end
