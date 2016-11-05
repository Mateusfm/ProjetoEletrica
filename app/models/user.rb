class User < ActiveRecord::Base
 enum role: [:nomal_user, :admin]
 EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

 scope :confirmed, -> { where.not(confirmed_at: nil) }

 validates_presence_of :email, :name
 validates_uniqueness_of :email
 validates_format_of :email, with: EMAIL_REGEXP

 has_secure_password

 has_attached_file :avatar,
                 :styles  =>  {  :medium  =>  "300x300#",  :thumb  =>  "150x150"  },
                 :default_url  =>  "avatar_default.jpg"
validates_attachment :avatar,
                     :content_type => { :content_type => ['image/jpg', 'image/png', 'image/jpeg'] }

 before_create do |user|
  user.confirmation_token = SecureRandom.urlsafe_base64
 end

 def confirm!
  return if confirmed?

  self.confirmed_at = Time.current
  self.confirmation_token = ''
  save!
 end

 def confirmed?
  confirmed_at.present?
 end

def self.authenticate(email,password)
  confirmed.
    find_by(email: email).
    try(:authenticate, password)
end

def imagem
    "#{avatar.url(:thumb)}"
end

end











