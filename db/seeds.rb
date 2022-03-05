# User.create!(email: 'shadman@gmail.com', password: '123456', password_confirmation: '123456')
user = User.new(
  email: 'shadman@gmail.com',
  password: '123456',
  password_confirmation: '123456'
)
user.skip_confirmation!
user.save!


30.times do 
  Course.create!([{
    title: Faker::Educator.course_name,
    description: Faker::TvShows::GameOfThrones.quote,
    user_id: User.first.id,
    short_description: Faker::Quote.famous_last_words,
    language: Faker::ProgrammingLanguage.name,
    level: 'Beginner',
    price: Faker::Number.between(from: 1000, to: 20000)
  }])
end