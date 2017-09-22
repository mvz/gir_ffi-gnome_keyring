require 'gir_ffi-gnome_keyring/attribute'

module GnomeKeyring
  # GLib::Array alias used when returning lists of GnomeKeyringAttribute.
  class AttributeList < GLib::Array
    def self.new
      ptr = GnomeKeyring::Lib.gnome_keyring_attribute_list_new
      wrap(ptr)
    end

    def self.wrap(ptr)
      super GnomeKeyring::Attribute, ptr
    end

    def self.from(it)
      case it
      when self then it
      when FFI::Pointer then wrap it
      else new.tap { |arr| arr.append_vals it }
      end
    end

    def append_string(name, value)
      v2 = GirFFI::InPointer.from(:utf8, name)
      v3 = GirFFI::InPointer.from(:utf8, value)
      GnomeKeyring::Lib.gnome_keyring_attribute_list_append_string self, v2, v3
    end

    def append_uint32(name, value)
      v2 = GirFFI::InPointer.from(:utf8, name)
      GnomeKeyring::Lib.gnome_keyring_attribute_list_append_uint32 self, v2, value
    end

    private

    # FIXME: Private method override. Bad.
    def check_element_size_match
      true
    end
  end
end
