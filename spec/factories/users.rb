FactoryBot.define do
  
  factory :user do
    name { 'Radhe'}
    email { 'radhe@gmail.com' }
    password { 'foobar' }
    password_confirmation { 'foobar' }
  end
end