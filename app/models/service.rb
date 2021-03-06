class Service < ActiveRecord::Base
 validates_presence_of :title, :description, :photo

 has_attached_file :photo, 
                 :styles  =>  {  :medium  =>  "300x300>",  :thumb  =>  "150x150>"  }, 
                 :default_url  =>  "imagem_default.png"
validates_attachment :photo,
                     :content_type => { :content_type =>
                     ['image/jpg', 'image/png', 'image/jpeg'] }

def complete_name
     "#{title}, #{description}"
  end

def imagem
    "#{photo.url(:thumb)}"
end

end
