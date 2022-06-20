@users_data = [
  {
    email: 'vitaly@email.com',
    admin: true,
    name: 'Виталий',
    age: 20,
    visibility: true,
    gender: 'He/him',
    destination_city: 'Санкт-Петербург',
    interests: ['Дизайн', 'Искусство'],
    tidiness: 9,
    smoking: true,
    instagram_link: 'http://instagram.com/vitasiempre',
    io: 'public/seed_content/vitaly.jpg',
    filename: 'vitaly.jpg'
  }, {
    email: 'mila@email.com',
    admin: true,
    name: 'Мила',
    age: 20,
    visibility: true,
    gender: 'She/her',
    destination_city: 'Москва',
    interests: ['Дизайн', 'Искусство'],
    tidiness: 9,
    smoking: false,
    instagram_link: 'http://instagram.com/jethappiness',
    io: 'public/seed_content/mila.jpg',
    filename: 'mila.jpg'
  }, {
    email: 'eva@email.com',
    admin: true,
    name: 'Ева',
    age: 20,
    visibility: true,
    gender: 'She/her',
    destination_city: 'Москва',
    interests: ['Дизайн', 'Искусство'],
    tidiness: 9,
    smoking: false,
    instagram_link: 'http://instagram.com/jethappiness',
    io: 'public/seed_content/eva.jpg',
    filename: 'eva.jpg'
  }
]

def seed
  reset_db
  create_users_with_profiles
  create_chats
  create_messages
  create_favourites
end

def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end

def create_users_with_profiles
  @users_data.each do |user_data|
    user = create_user(user_data)
    profile = create_profiles(user, user_data)

    puts "User with name #{user.profile.name} created with email #{user.email}"
  end
end

def create_user(user_data)
  User.create!(
    email: user_data[:email],
    admin: user_data[:admin],
    password: "testtest"
  )
end

def create_profiles(user, user_data)
  profile = Profile.create!(
    user_id: user.id,
    name: user_data[:name],
    age: user_data[:age],
    visibility: user_data[:visibility],
    gender: user_data[:gender],
    destination_city: user_data[:destination_city],
    interests: user_data[:interests],
    tidiness: user_data[:tidiness],
    smoking: user_data[:smoking],
    instagram_link: user_data[:instagram_link]
  )

  File.open('public/uploads/profile/avatar/1/thumb_1BE7D967-1BF5-4C85-B6BB-6C6077843C4A.jpeg') do |f|
    profile.avatar = f
  end
end

def create_users
  i = 1
  10.times do
    user_data = {
      email: "user#{i}@email.com",
      password: "testtest"
    }
    if i == 1
       user_data[:admin] = true
    end
    user = User.create!(user_data)
    puts "User created with id #{user.id}"
    i += 1
  end
end

def create_chats
  10.times do
    users = User.all.sample(2)
    chat = Chat.create!
    users[0].chat_list_items.create!(chat_id: chat.id)
    users[1].chat_list_items.create!(chat_id: chat.id)
    puts "Chat created with id #{chat.id}, users #{chat.users.ids}, chat list items #{chat.chat_list_items.ids}"
  end
end

def create_messages
  chats = Chat.all
  chats.each do |chat|
    chat_users = chat.users
    10.times do
      message_one = chat.messages.create!(body: 'u up?', user_id: chat_users[0].id)
      message_two = chat.messages.create!(body: 'yup', user_id: chat_users[1].id)
      status_one = MessageStatus.create!(message_id: message_one.id, user_id: chat_users[0].id, status: 0)
      status_two = MessageStatus.create!(message_id: message_two.id, user_id: chat_users[0].id, status: 1)

      puts "Message #{message_one.id} #{message_one.body} sent by user #{message_one.user.id} to chat #{message_one.chat.id}. Status #{status_one.status}"
    end
  end
end

def create_favourites
  3.times do
    users = User.all.sample(2)
    users[0].favourites.create!(profile_id: users[1].profile.id)
    user_saved_profiles_ids = users[0].saved_profiles.collect { |saved_profile| saved_profile.id }
    favourite_user_profile_id = users[1].profile.id

    if (user_saved_profiles_ids.include?(favourite_user_profile_id))
      puts "User #{users[0].profile.name} added user #{users[1].profile.name} to their favs"
    else
      puts "Favouritisation failed"
    end
  end
end

seed
