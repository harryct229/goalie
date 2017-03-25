# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = 10.times.map do |i|
  User.create! email: "email_#{i}@example.com", fullname: "User_#{i}",
    password: "12345678", password_confirmation: "12345678", 
    confirmed_at: Time.now
end

users.each do |user|
  5.times do |i|
    goal = user.goals.create! deadline: Time.current + 5.days,
      description: "#{user.fullname} - Private - Description #{i}",
      target: 10,
      status: "in_progress",
      current_quantity: 5
    user.activities.create! goal: goal, quantity: 5
  end

  5.times do |i|
    goal = user.goals.create! deadline: Time.current + 5.days,
      description: "#{user.fullname} - Description #{i}",
      target: 10,
      status: "done",
      current_quantity: 10
    user.activities.create! goal: goal, quantity: 10
  end
end

5.times do |i|
  group = Group.create! name: "Group_#{i}"
  goal = group.create_goal! deadline: Time.current + 5.days,
    description: "#{group.name} - Group - Description #{i}",
    target: 10,
    status: "in_progress",
    current_quantity: 5

  User.all[i..(i + 4)].each do |user|
    group.user_groups.create! user: user
    activity = user.activities.create! goal: goal, quantity: 1
    user.comments.create! activity: activity, content: "Commento"
  end
end