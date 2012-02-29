# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
  has_many :comments 
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password
  validates :name,  presence: true, length: { maximum: 50 }
  valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: valid_email_regex }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6}
  before_save :create_remember_token
  
  def karma
    self.ratings.sum(:score)
  end

  def positive_votes
    self.ratings.sum(:score, :conditions => 'score > 0')
  end

  def negative_votes
    self.ratings.sum(:score, :conditions => 'score < 0')
  end 

private
  def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
  end
end


