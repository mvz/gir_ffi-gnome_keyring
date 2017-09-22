GnomeKeyring.load_class :Attribute
module GnomeKeyring
  # Overrides for GnomeKeyringAttribute
  class Attribute
    setup_method 'list_new'
    setup_method 'list_append_string'
    setup_method 'list_append_uint32'

    private_class_method :list_new,
                         :list_append_string,
                         :list_append_uint32,
                         :list_copy,
                         :list_free,
                         :list_to_glist

    def make_finalizer
      # Don't make a finalizer; Use FFI's regular free of the pointer instead.
    end
  end
end
