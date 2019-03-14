require 'rails_helper'

RSpec.describe Task, type: :model do
	let(:user) {build(:user)}	

	it "has a valid factory" do
		# expect(build(:task)).to be_valid
		expect(FactoryBot.build(:homework)).to be_valid
	end
	
	it 'is valid with required attributes' do
		task = create(:email)
		expect(task).to be_valid
	end

	it 'is valid with valid attributes' do
		# change from :vote to :homework
    task = create(:homework)
    expect(task).to be_valid
	end
	
	it 'is invalid without a name' do
		task = build(:homework, name: nil)
		expect(task).not_to be_valid
	end

	it 'is invalid without a priority' do
		task = build(:email, priority: nil)
		expect(task).not_to be_valid
	end

  it 'is invalid without name' do
		task = build(:task, name: nil)
    expect(task).not_to be_valid
  end

  it 'is invalid without priority' do
    task = build(:task, priority: nil)
    expect(task).not_to be_valid
	end
	
	it 'is invalid without Due Date' do
		task = build(:homework, due_date: nil)
		expect(task).not_to be_valid
	end

	it 'belongs to User' do
		expect(Task.reflect_on_association(:user).macro).to eq(:belongs_to)
	end
end
