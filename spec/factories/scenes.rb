FactoryBot.define do
  factory :scene do
    title { Faker::Fantasy::Tolkien.unique.location }
  end
end
