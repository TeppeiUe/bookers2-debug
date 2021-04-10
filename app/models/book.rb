class Book < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

	def favorited_by?(user)
    	favorites.where(user_id: user.id).exists?
	end

	def self.search_for(how, value)
		if how == "match"
			Book.where(title: value)
		elsif how == "forward"
			Book.where('title LIKE ?', "#{value}%")
		elsif how == "backward"
			Book.where('title LIKE ?', "%#{value}")
		elsif how == "partical"
			Book.where('title LIKE ?', "%#{value}%")
		end
	end

	def self.data_reset
		Book.delete_all
		p 'delete all'
	end

end
