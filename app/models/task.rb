class Task < ApplicationRecord
	validates :name, :priority, presence: true
end
