#
# This module builds slug when the record is created for the very first time.
#
# Usage:
#
# class Product < ActiveRecord::Base
#   include SlugBuilder
#   build_slug allow_nil: true, column_name: :title
# end
#
# build_slug line is needed only if you are passing parameter otherwise that line can be omitted
#
module SlugBuilder
  extend ActiveSupport::Concern

  included do
    before_create :set_slug
    class_attribute :slug_options
    self.slug_options = {}
  end

  module ClassMethods
    def build_slug(options = {})
      self.slug_options = options
    end
  end

  def to_param
    self.slug
  end

  def set_slug
    col = slug_options[:column_name]
    raise self.class.name unless col
    base_slug = (self.send(col)).present? ? self.send(col) : self.id
    base_slug = base_slug.parameterize

    slug = base_slug
    counter = 2

    while self.class.exists?(slug: slug) do
      slug = "#{base_slug}-#{counter}"
      counter = counter + 1
    end

    self.slug = slug if self.slug.blank?
  end
end
