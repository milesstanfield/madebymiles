class Role < ActiveRecord::Base
  belongs_to :portfolio
  validates :title, uniqueness: true
end
