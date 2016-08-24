FactoryGirl.define do
  factory :product do
    sequence(:name) {|num| "#{num} Macbook"}
    quantity 10
    price 999.99
    description "Awesome Computer!"
    promoted false
  end

  factory :user do
  	name "User"
  	email "user@user.com"
  	password "password"
  	password_confirmation "password"
  	admin false
  end

end

