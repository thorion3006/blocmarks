class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, length: { minimum: 3, maximum: 100 }, presence: true

  validates :uname,
           presence: true,
           uniqueness: { case_sensitive: false },
           length: { minimum: 3, maximum: 100 }

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  def self.find_for_database_authentication(warden_conditions)
   conditions = warden_conditions.dup
   if login = conditions.delete(:login)
     where(conditions.to_hash).where(["lower(uname) = :value OR lower(email) = :value", { :value => login.downcase }]).first
   elsif conditions.has_key?(:uname) || conditions.has_key?(:email)
     where(conditions.to_hash).first
   end
  end

  def avatar_url(size)
   gravatar_id = Digest::MD5::hexdigest(self.email).downcase
   "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end
end
