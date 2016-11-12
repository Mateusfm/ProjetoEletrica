class Offering < ActiveRecord::Base
  belongs_to :produto

  validates_uniqueness_of :produto_id

end
