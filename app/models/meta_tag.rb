class MetaTag < ActiveRecord::Base
  has_and_belongs_to_many :pages
  validates :attr, :attr_value, :content, presence: true
end
