# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(name: 'Nunes', photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgGzZ0z42r96DLQES7kolpBPw5xM2UqS04GKKYyZiF&s', bio: 'Teacher from Brazil.')
User.create(name: 'Aron', photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgGzZ0z42r96DLQES7kolpBPw5xM2UqS04GKKYyZiF&s', bio: 'Teacher from Eritrea.')
User.create(name: 'Vitor', photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgGzZ0z42r96DLQES7kolpBPw5xM2UqS04GKKYyZiF&s', bio: 'Teacher from Thailand.')
User.create(name: 'Mumenya', photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgGzZ0z42r96DLQES7kolpBPw5xM2UqS04GKKYyZiF&s', bio: 'Teacher from Kenya.')
User.create(name: 'Karla', photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgGzZ0z42r96DLQES7kolpBPw5xM2UqS04GKKYyZiF&s', bio: 'Teacher from Venezuela.')
User.create(name: 'Tony', photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgGzZ0z42r96DLQES7kolpBPw5xM2UqS04GKKYyZiF&s', bio: 'Teacher from Kenya.')

Post.create(user: User.find(1), title: 'Hello', text: 'This is my first post')
Post.create(user: User.find(1), title: 'Title 2', text: 'This is my second post')

Post.create(user: User.find(2), title: 'Title 1', text: 'This is my post')
Post.create(user: User.find(2), title: 'Title 2', text: 'This is my post')
Post.create(user: User.find(2), title: 'Title 3', text: 'This is my post')

Post.create(user: User.find(3), title: 'Title 1', text: 'This is my post')
Post.create(user: User.find(3), title: 'Title 2', text: 'This is my post')
Post.create(user: User.find(3), title: 'Title 3', text: 'This is my post')
Post.create(user: User.find(3), title: 'Title 4', text: 'This is my post')

Post.create(user: User.find(4), title: 'Title 1', text: 'This is my post')
Post.create(user: User.find(4), title: 'Title 2', text: 'This is my post')
Post.create(user: User.find(4), title: 'Title 3', text: 'This is my post')
Post.create(user: User.find(4), title: 'Title 4', text: 'This is my post')
Post.create(user: User.find(4), title: 'Title 5', text: 'This is my post')

Post.create(user: User.find(5), title: 'Title 1', text: 'This is my post')
Post.create(user: User.find(5), title: 'Title 2', text: 'This is my post')
Post.create(user: User.find(5), title: 'Title 3', text: 'This is my post')
Post.create(user: User.find(5), title: 'Title 4', text: 'This is my post')
Post.create(user: User.find(5), title: 'Title 5', text: 'This is my post')
Post.create(user: User.find(5), title: 'Title 6', text: 'This is my post')


Comment.create(post: Post.find(2), user: User.find(2), text: 'Hi Aron!' )
Comment.create(post: Post.find(3), user: User.find(4), text: 'Hi Aron!' )