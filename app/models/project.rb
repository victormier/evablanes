class Project < ActiveRecord::Base
  include ArmotReloading
  include RankedModel

  ranks :sort_order

  has_many :project_pictures

  armotize :title, :subtitle, :description, :cover_title
  define_localized_accessors_for :title, :subtitle, :description, :cover_title

  mount_uploader :cover_picture, ProjectCoverPictureUploader
  mount_uploader :featured_project_picture, FeaturedProjectPictureUploader
  mount_uploader :slider_picture, SliderPictureUploader

  validates_presence_of :title_en, :title_es, :title_ca, :cover_picture
  validates_uniqueness_of :title, :slug
  validates_presence_of :slider_picture, if: :in_slider

  attr_accessible :title_en, :title_es, :title_ca, :subtitle_en, :subtitle_es, :subtitle_ca,
    :description_en, :description_es, :description_ca,
    :cover_picture, :featured_project_picture, :slider_picture, :sort_order, :cover_cols, :cover_title_en, :cover_title_es, :cover_title_ca,
    :slider_order, :featured_order

  before_validation :set_order, on: :create
  after_save :reload_armot!

  include SlugBuilder
  build_slug column_name: :title

  scope :ordered, rank(:sort_order)
  scope :featured_ordered, order(:featured_order)
  scope :slider_ordered, order(:slider_order)
  scope :published, where(published: true)
  scope :in_slider, where(in_slider: true)
  scope :featured, where(featured: true)
  scope :after, lambda{ |project| where('sort_order > ?', project.sort_order) }

  def to_param
    slug
  end

  def self.find_for_show(slug)
    find_by_slug(slug)
  end

  def next_or_first
    Project.published.ordered.after(self).first || Project.published.ordered.first
  end

  private

  def set_order
    self.update_attribute :sort_order_position, :last
  end
end