namespace :db do
  task populate: :environment do
    users = User.all(limit: 1)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.goals.create!(content: content, start_date: Time.zone.now, end_date: 30.days.from_now) }
    end
  end
end
