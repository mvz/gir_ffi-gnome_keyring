module GnomeKeyring
  load_class :Attribute

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
  end
end