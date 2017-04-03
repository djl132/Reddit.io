FactoryGirl.define do
   factory :vote do
     value [1,-1].sample
     user
     post
   end
 end
