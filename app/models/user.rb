class User < ApplicationRecord
	validates :firstname, :lastname, :email, presence: true
	validates_uniqueness_of :email
end
