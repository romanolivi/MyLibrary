# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

richdad = Book.create(name: 'Rich Dad Poor Dad', author: 'Robert Kiyosaki', genre: 'Finance', page_count: 300)
four = Book.create(name: 'The 4-Hour Workweek', author: 'Tim Ferris', genre: 'Self-Help', page_count: 308)
shadow = Book.create(name: 'Shadow of the Wind', author: 'Carlos Ruiz Zafon', genre: 'Mystery', page_count: 487)
gatsby = Book.create(name: 'The Great Gatsby', author: 'F. Scott Fitzgerald', genre: 'Tragedy', page_count: 218)
ulysses = Book.create(name: 'Ulysses', author: 'James Joyce', genre: 'Modernist', page_count: 730)