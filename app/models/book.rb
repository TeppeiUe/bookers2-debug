class Book < ApplicationRecord
	belongs_to :user
	has_many :favoties, dependent: :destroy

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
