class User < ApplicationRecord
	validates :firstname, :lastname, :email, presence: true
	validates_uniqueness_of :email
	has_many :tasks
end
