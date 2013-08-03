require 'gir_ffi'

GirFFI.setup 'GnomeKeyring'

require 'gir_ffi-gnome_keyring/attribute'
require 'gir_ffi-gnome_keyring/attribute_list'
require 'gir_ffi-gnome_keyring/found'

module GnomeKeyring
  setup_method :find_items_sync

  class << self
    remove_method :find_items_sync
  end

  def self.find_items_sync(type, attributes)
    _v2 = GnomeKeyring::AttributeList.from(attributes)
    _v3 = GirFFI::InOutPointer.for(:glist)
    _v4 = GnomeKeyring::Lib.gnome_keyring_find_items_sync(type, _v2, _v3)
    _v5 = GLib::List.wrap(GnomeKeyring::Found, _v3.to_value)
    return [_v4, _v5]
  end
end
