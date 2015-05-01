FactoryGirl.define do

  factory :comment do
    message "Wonderful atmosphere!"
    rating "4_stars"
    association :user
    association :place
  end

  factory :photo do
    caption "check this place out"
    picture "/assets/slider1.jpg"
    association :user
    association :place
  end

  factory :place do
    name "Kaffee Kulture"
    description "A chill hangout for day trippers"
    address "Weserstrasse 58, 12045 Berlin, Germany"
    latitude(42.3631519)
    longitude(-71.056098)
    association :user
  end


  factory :user do
    sequence :email do |n|
      "haylic#{n}@gmail.com"
    end
    password "omglolhahaha"
    password_confirmation "omglolhahaha"
  end
end