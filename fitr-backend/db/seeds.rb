# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

for i in 1..5 do
    User.create(
        name: Faker::Name.first_name,
        email: "test#{i}@gmail.com",
        password: "test#{i}"
    )

    puts "Created user #{i}"
end

for user in User.all
    5.times do
        user.workouts.create(
            date: DateTime.new(2019, rand(1..12), 1+rand(1..28)),
            exercises: "Test Exercises",
        )
    end
end

# for i in 1..30 do
#     Workout.create(
#         date: DateTime.new(2019, rand(1..12), 1+rand(1..28)),
#         exercises: "Test Exercises",
#     )

#     puts "Created workout #{i}"
# end