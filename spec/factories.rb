FactoryGirl.define do  factory :user do
    
  end
  
  
  sequence(:email,aliases: [:from]) { |n| "user#{n}@example.com" }

  factory :subscription do
    email
  end
  
  
  factory :story do
    from "MyString"
    text "MyString"
    user_id 1
    title "MyString"
  end

  factory :email, class: OpenStruct do
    #Assumes Griddler.configure.to is :hash (default)
    to [{ full: 'lettersfrompaul@example.com',
          email: 'lettersfrompaul@example.com',
          token: 'to_user',
          host: 'example.com',
          name: nil }]

    from

    subject 'My story'
    body "I'm really excited to share this good news with you"

  end
end
