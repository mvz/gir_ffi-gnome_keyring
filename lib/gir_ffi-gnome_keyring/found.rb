require 'gir_ffi-gnome_keyring/attribute_list'

module GnomeKeyring
  load_class :Found

  class Found
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
