module GnomeKeyring
  load_class :Attribute

  class Attribute
    setup_method 'list_new'
  end

  class AttributeList < GLib::Array
    def self.new
      ptr = GnomeKeyring::Lib.gnome_keyring_attribute_list_new
      wrap(GnomeKeyring::Attribute, ptr)
    end

    private

    # FIXME: Private method override. Bad.
    def check_element_size_match
      true
    end
  end
end
