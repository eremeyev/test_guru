class Badge < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :badge_checkers
  validates_uniqueness_of :name
  validates_presence_of :name
  validate :validate_method_is_permitted #, { message: "Not permitted parts of sentence" }
  serialize :rules, Hash
  
  IMAGES = %w[star rocket mortar-board flame light-bulb verified]
  COLORS = %w[red orange green blue darkblue purple]

  private

  def validate_method_is_permitted
    return false if method.blank?
    ActiveRecord::Relation.instance_methods.include?(method.to_sym)
  end
end
