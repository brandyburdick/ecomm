FactoryGirl.define do
  factory :product do
    sequence(:name) {|num| "#{num} Macbook"}
    quantity 10
    price 999.99
    description "Awesome Computer!"
    promoted false
  end
end
