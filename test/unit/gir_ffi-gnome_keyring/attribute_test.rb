# frozen_string_literal: true

require 'test_helper'

describe GnomeKeyring::Attribute do
  describe '.list_new' do
    it 'is private' do
      proc { GnomeKeyring::Attribute.list_new }.must_raise NoMethodError
    end
  end

  describe '.list_append_string' do
    it 'is private' do
      proc { GnomeKeyring::Attribute.list_append_string }.must_raise NoMethodError
    end
  end

  describe '.list_append_uint32' do
    it 'is private' do
      proc { GnomeKeyring::Attribute.list_append_uint32 }.must_raise NoMethodError
    end
  end

  describe '.list_copy' do
    it 'is private' do
      proc { GnomeKeyring::Attribute.list_copy }.must_raise NoMethodError
    end
  end

  describe '.list_free' do
    it 'is private' do
      proc { GnomeKeyring::Attribute.list_free }.must_raise NoMethodError
    end
  end

  describe '.list_to_glist' do
    it 'is private' do
      proc { GnomeKeyring::Attribute.list_to_glist }.must_raise NoMethodError
    end
  end
end
