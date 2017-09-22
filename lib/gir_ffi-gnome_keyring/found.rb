require 'gir_ffi-gnome_keyring/attribute_list'

GnomeKeyring.load_class :Found

module GnomeKeyring
  # Overrides for GnomeKeyringFound
  class Found
    remove_method :attributes
    remove_method :attributes=

    def attributes
      struct = GnomeKeyring::Found::Struct.new(@struct.to_ptr)
      GnomeKeyring::AttributeList.wrap(struct[:attributes])
    end

    def attributes=(value)
      struct = GnomeKeyring::Found::Struct.new(@struct.to_ptr)
      struct[:attributes] = GnomeKeyring::AttributeList.from(value)
    end
  end
end
