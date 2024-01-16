# factory for message
FactoryBot.define do
  factory :message do
    person_name { 'John Doe' }
    person_mail { 'john.doe@example.com' }
    description { 'A sample description' }
  end
end
