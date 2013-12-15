class Project < ActiveRecord::Base
  include RankedModel

  ranks :sort_order

  has_many :project_pictures

  armotize :title, :subtitle, :description
  define_localized_accessors_for :title, :subtitle, :description

  mount_uploader :cover_picture, ProjectCoverPictureUploader
  mount_uploader :featured_project_picture, FeaturedProjectPictureUploader
  mount_uploader :slider_picture, SliderPictureUploader

  validates_presence_of :title, :cover_picture
  validates_uniqueness_of :title

  attr_accessible :title_en, :title_es, :title_ca, :subtitle_en, :subtitle_es, :subtitle_ca,
    :description_en, :description_es, :description_ca,
    :cover_picture, :featured_project_picture, :slider_picture, :sort_order

  before_validation :set_order, on: :create
  before_save :set_slug, on: :create

  scope :ordered, rank(:sort_order)
  scope :published, where(published: true)
  scope :in_slider, where(in_slider: true)
  scope :featured, where(featured: true)

  def to_param
    slug
  end

  def self.find_for_show(slug)
    find_by_slug(slug)
  end

  private

  def set_order
    self.update_attribute :sort_order_position, :last
  end

  def set_slug
    self.slug = title.parameterize
  end
end