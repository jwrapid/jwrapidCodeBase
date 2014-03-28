FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"

  	factory :admin do
      admin true
   	end
   end

   	
   factory :product do 
		sequence(:name)  { |n| "Example Product #{n}" }
		image "c000001.png"
		price 99.99
		description "This is a description for example product"
   end

end