begin
    #Create an instritution
    Institution.create!(
      name: 'North Carolina State University',
    )
    num_users = 20
    # Create an admin user
    User.create!(
      name: 'admin',
      email: 'admin2@example.com',
      password: 'password123',
      full_name: 'admin admin',
      institution_id: 1,
      role_id: 1
    )
    user_ids = []
    puts "Creating default user"
    user_ids << User.create(
      name: 'user',
      email: 'user@user.com',
      password: 'password',
      full_name: 'user user',
      institution_id: 1,
      role_id: 4
    ).id

    puts "Creating users"
    num_users.times do
        user_ids << User.create(
          name: Faker::Internet.unique.username,
            email: Faker::Internet.unique.email,
            password: "password",
            full_name: Faker::Name.name,
            institution_id: 1,
            role_id: Faker::Number.between(from: 2, to: 4)
        ).id
    end
rescue ActiveRecord::RecordInvalid => e
    puts 'The db has already been seeded'
end
