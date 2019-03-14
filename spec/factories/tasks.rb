FactoryBot.define do
	factory :homework, class: Task do
		association :user
		name "complete homework"
		due_date { DateTime.now + 2.days}
		priority 1
	end

	factory :email, class: Task do
		association :user
		name "reply to Zack's email"
		due_date { DateTime.now }
		priority 2
	end

  factory :task do
    name "buy beer"
    priority 2

    factory :vote do
      name 'vote'
      priority 1
    end

    factory :invalid_task, class: Task do
      name nil
			priority nil
			due_date nil
    end
  end
end
