FactoryGirl.define do
  factory :product do
    sequence(:name) {|num| "#{num} Macbook"}
    quantity 10
    price 999.99
    description "Awesome Computer!"
    promoted false
  end

  factory :admin_user, class: User do
    name "Admin User"
    sequence(:email) {|num| "user#{num}@user.com"}
    password "password"
    password_confirmation "password"
    admin true
  end

  factory :non_admin_user, class: User do
    name "Regular User"
    sequence(:email) {|num| "user#{num}@user.com"}
    password "password"
    password_confirmation "password"
    admin false
  end

end

