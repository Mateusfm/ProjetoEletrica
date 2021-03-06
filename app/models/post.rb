class Post < ActiveRecord::Base
  validates_presence_of :titulo, :subtitulo, :texto, :photo

  has_attached_file :photo, 
                 :styles  =>  {  :medium  =>  "300x300>",  :thumb  =>  "300x300>"  }, 
                 :default_url  =>  "imagem_default.png"
  validates_attachment :photo,
                     :content_type => { :content_type =>
                     ['image/jpg', 'image/png', 'image/jpeg'] }

def imagem
    "#{photo.url(:original)}"
end

def imagem_mini
    "#{photo.url(:thumb)}"
end

end
