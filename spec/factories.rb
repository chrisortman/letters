FactoryGirl.define do  factory :story do
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

    from({ token: 'happy_dad',
           host: 'gmail.com',
           email: 'happydad@example.com',
           full: 'Happy Dad<happydad@example.com>',
           name: 'Happy Dad' })

    subject 'My story'
    body "I'm really excited to share this good news with you"

  end
end
