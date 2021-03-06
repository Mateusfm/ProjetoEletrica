class Produto < ActiveRecord::Base
  belongs_to :category
  has_one :offering

  validates_presence_of :nome, :descricao, :photo, :category_id

  attr_accessor :new_category_name

  before_save :create_category_from_name

  has_attached_file :photo,
                 :styles  =>  {  :medium  =>  "300x300#",  :thumb  =>  "150x150>"  },
                 :default_url  =>  "imagem_default.png"
validates_attachment :photo,
                     :content_type => { :content_type => ['image/jpg', 'image/png', 'image/jpeg'] }


def create_category_from_name
      create_category(:name => new_category_name) unless new_category_name.blank?
 end

def complete_name
     "#{nome}, #{descricao}"
  end

def imagem
    "#{photo.url(:thumb)}"
end

def imagemSlide
    "#{photo.url(:medium)}"
end

end
