class User < ActiveRecord::Base
  attr_accessible :email, :password, :role, :adress, :password_confirmation,:name,:surname,:phone,:index
  has_secure_password
  validates_presence_of :password,:email,:adress, :on => :create
  validates :password, :confirmation => true, :on => :save
  validates :password_confirmation, :presence => true, :on => :save
  validates :email, :uniqueness => true
end
