class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :tab_id, :name           
  #validates_uniqueness_of :tab_id, :allow_nil => true
  has_one :profile
  belongs_to :tab
  
  ROLES = %w[super_user tab_user]

end
