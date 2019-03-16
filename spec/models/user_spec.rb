require 'rails_helper'

RSpec.describe User, type: :model do
	let(:user) {build(:user)}
	# let(:user2) {build(:user)}

	it 'has a valid factory' do
		expect(user).to be_valid
	end

	it 'is invalid without firstname' do
		user.firstname = nil
		expect(user).not_to be_valid
	end
	
	it 'is invalid without lastname' do
		user.lastname = nil
		expect(user).not_to be_valid
	end
	
	it 'is invalid without email' do
		user.email = nil
		expect(user).not_to be_valid
	end
	
	it 'is invalid without unique email' do
		# user.email = "user@email.com"
		create(:user, email: "user@email.com")
		invalid_user = build(:user, email: "user@email.com")
		expect(invalid_user).not_to be_valid
	end

	# it 'has many tasks' do
	# end

	it 'has two tasks' do
		expect(user.tasks.length).to eq(2)
	end

	it 'returns tasks due today' do
		user.tasks.first.update(due_date: Time.now.to_date)
		expect(user.due_today.length).to eq(1)
	end
end
