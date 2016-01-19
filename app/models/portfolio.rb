class Portfolio < ActiveRecord::Base
  has_many :images
  scope :recent, -> { order("created_at").reverse_order }
end