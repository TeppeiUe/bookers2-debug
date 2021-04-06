class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  attachment :profile_image, destroy: false

  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true
  validates :introduction, length: { maximum: 50 }

  def follow(user)
    following << user
  end
  def unfollow(user)
    active_relationships.find_by(followed_id: user.id).destroy
  end
  def following?(user)
    following.include?(user)
  end

  def self.search_for(how, value)
    if how == "match"
      User.where(name: value)
    elsif how == "forward"
      User.where('name LIKE ?', "#{value}")
    elsif how == "backward"
      User.where('name LIKE ?', "#{value}%")
    elsif how == "partical"
      User.where('name LIKE ?', "%#{value}%")
    end
  end

end