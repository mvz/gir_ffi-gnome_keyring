**This project is no longer being maintained. GnomeKeyring is no longer available in modern Linux distributions and you should use `libsecret` instead,**

# GirFFI-GnomeKeyring

by Matijs van Zuijlen

## Description

GirFFI-based Ruby bindings for the deprecated GnomeKeyring client library

**Note:** The GnomeKeyring client library is deprecated and you should use `libsecret` instead.

## Status

[![Gem Version](https://badge.fury.io/rb/gir_ffi-gnome_keyring.png)](http://badge.fury.io/rb/gir_ffi-gnome_keyring)
[![Dependency Status](https://gemnasium.com/mvz/gir_ffi-gnome_keyring.png)](https://gemnasium.com/mvz/gir_ffi-gnome_keyring)
[![Build Status](https://travis-ci.org/mvz/gir_ffi-gnome_keyring.png?branch=master)](https://travis-ci.org/mvz/gir_ffi-gnome_keyring)

## Features

* Auto-generated bindings using GObject introspection.
* Adds overrides for introspection data bugs.

## Usage

```ruby
require 'gir_ffi-gnome_keyring'

attrs = GnomeKeyring::AttributeList.new
attrs.append_string "attribute-name", "string value"
attrs.append_uint32 "other name", 42

result_code, item_id = GnomeKeyring.item_create_sync nil,
  :generic_secret, "foobar", attrs, "foobar's secret", false

p [result_code, item_id]

if result_code == :ok
  code, info = GnomeKeyring.item_get_info_sync nil, item_id
  if code == :ok
    puts "Item: #{info.get_display_name} of type #{info.get_type}"
  end
  GnomeKeyring.item_delete_sync nil, item_id
  code, info = GnomeKeyring.item_get_info_sync nil, item_id
  p [code, info]
end
```

## Install

```bash
gem install gir_ffi-gnome_keyring
```

## Requirements

This gem depends on the [`gir_ffi`](https://rubygems.org/gems/gir_ffi) gem and
its requirements. In addition, it needs introspection data for the
gnome-keyring client library.

On Debian and Ubuntu, you can get this by installing `gir1.2-gnomekeyring-1.0`.
Note that this package is not available on newer versions of Debian and Ubuntu.

This gem has not been tested on Mac OS X or Microsoft Windows. YMMV. Pull
requests to support these platforms are welcome.

## License

Copyright &copy; 2013&ndash;2016, 2018&ndash;2022 [Matijs van Zuijlen](http://www.matijs.net)

GirFFI-GnomeKeyring is free software, distributed under the terms of the GNU
Lesser General Public License, version 2.1 or later. See the file COPYING.LIB
for more information.
