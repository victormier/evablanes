class Photo < ActiveRecord::Base
  include RankedModel

  ranks :sort_order

  mount_uploader :picture, PhotoUploader

  before_validation :set_order, on: :create

  scope :published, where(published: true)
  scope :ordered, rank(:sort_order)

  attr_accessible :picture

  private

  def set_order
    self.update_attribute :sort_order_position, :last
  end
end