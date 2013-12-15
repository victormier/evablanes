class ProjectPicture < ActiveRecord::Base
  include RankedModel

  belongs_to :project

  ranks :sort_order, :with_same => :project_id

  mount_uploader :picture, ProjectPictureUploader

  before_validation :set_order, on: :create

  scope :ordered, rank(:sort_order)

  attr_accessible :picture

  private

  def set_order
    self.update_attribute :sort_order_position, :last
  end
end