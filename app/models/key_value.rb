class KeyValue < ActiveRecord::Base
  include ArmotReloading

  armotize :value
  define_localized_accessors_for :value

  attr_accessible :key, :value_en, :value_es, :value_ca

  validates_presence_of :key

  after_save :reload_armot!
end