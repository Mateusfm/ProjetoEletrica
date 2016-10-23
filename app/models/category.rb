class Category < ActiveRecord::Base
  has_many :produtos
  validates_presence_of :name

end
