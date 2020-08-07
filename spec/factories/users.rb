FactoryBot.define do
  factory :user do
    nickname              { "test" }
    email                 { "factorybot@test.com" }
    password              { "password00" }
    password_confirmation { password }
    last_name             { "工場" }
    first_name            { "太郎" }
    last_name_reading     { "コウジョウ" }
    first_name_reading    { "タロウ" }
    birth_date            { "1930-01-01" }
  end
end
