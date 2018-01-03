# frozen_string_literal: true

require 'test_helper'

describe GnomeKeyring::Found do
  let(:instance) { GnomeKeyring::Found.new }

  describe '#attributes' do
    it 'returns nil by default' do
      attrs = instance.attributes
      attrs.must_be_nil
    end

    it 'returns an assigned AttributeList' do
      attrs = GnomeKeyring::AttributeList.new
      struct = GnomeKeyring::Found::Struct.new(instance.to_ptr)
      struct[:attributes] = attrs.to_ptr

      result = instance.attributes
      result.must_be_instance_of GnomeKeyring::AttributeList
      result.to_ptr.must_equal attrs.to_ptr
    end
  end

  describe '#attributes=' do
    it 'assigns its argument to the correct struct member' do
      attrs = GnomeKeyring::AttributeList.new
      instance.attributes = attrs
      struct = GnomeKeyring::Found::Struct.new(instance.to_ptr)
      result = struct[:attributes]
      result.must_equal attrs.to_ptr
    end
  end
end
