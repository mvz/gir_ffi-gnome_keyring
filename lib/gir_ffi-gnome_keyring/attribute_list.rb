module GnomeKeyring
  load_class :Attribute

  class Attribute
    setup_method 'list_new'
    setup_method 'list_append_string'
  end

  class AttributeList < GLib::Array
    def self.new
      ptr = GnomeKeyring::Lib.gnome_keyring_attribute_list_new
      wrap(GnomeKeyring::Attribute, ptr)
    end

    # FIXME: Remove once GLib::Array#index has been fixed
    def index idx
      ptr = @struct[:data] + idx * get_element_size
      GnomeKeyring::Attribute.wrap(ptr)
    end

    def append_string name, value
      _v2 = GirFFI::InPointer.from(:utf8, name)
      _v3 = GirFFI::InPointer.from(:utf8, value)
      GnomeKeyring::Lib.gnome_keyring_attribute_list_append_string self, _v2, _v3
    end

    private

    # FIXME: Private method override. Bad.
    def check_element_size_match
      true
    end
  end
end
