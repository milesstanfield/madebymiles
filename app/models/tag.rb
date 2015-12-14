class Tag < ActiveRecord::Base
  validates_uniqueness_of :name
  belongs_to :post
end