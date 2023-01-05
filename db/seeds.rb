# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

cats = [
  {
    id: 1,
    name: 'Simba',
    age: 4,
    enjoys: 'chasing after rabbits',
    image: 'https://en.wikifur.com/w/images/c/cf/YoungSimbaSmilestlk.png',
    image2: 'https://static.tvtropes.org/pmwiki/pub/images/lion_king_disneyscreencapscom_1131.jpg',
    image3: 'https://imgix.bustle.com/uploads/image/2022/9/20/2cd45461-a82a-4496-971d-0820708fc84a-g_thelionking_08_e0017c86.jpeg?w=1200&h=630&fit=crop&crop=faces&fm=jpg',
    image4: 'https://giphy.com/gifs/cartoon-the-lion-king-simba-DvMHwFYLVHlZe'
  },
  {
    id: 2,
    name: 'Nala',
    age: 4,
    enjoys: 'chasing after rabbits',
    image: 'http://pm1.narvii.com/7545/bcd65c2754befac6c75589f92a5173b6babe6b51r1-719-405v2_uhq.jpg',
    image2: '',
    image3: '',
    image4: ''
  },
  {
    id: 3,
    name: 'Yzma',
    age: 50,
    enjoys: 'creating potions and plotting to kill Emporer Kuzco',
    image: 'https://cdnb.artstation.com/p/assets/images/images/036/038/093/large/daniel-d-souza-000.jpg?1616572378',
    image2: '',
    image3: '',
    image4: ''
  },
  {
    id: 4,
    name: 'Dinah',
    age: 4,
    enjoys: 'chasing after rabbits',
    image: 'https://static.wikia.nocookie.net/aliceinwonderland/images/2/25/Dinah.jpg/revision/latest?cb=20100313211328',
    image2: '',
    image3: '',
    image4: ''
  },
  {
    id: 5,
    name: 'Mufasa',
    age: 4,
    enjoys: 'chasing after rabbits',
    image: 'https://wegotthiscovered.com/wp-content/uploads/2022/09/Mufasa-the-lion-king.jpg',
    image2: '',
    image3: '',
    image4: ''
  },
  {
    id: 6,
    name: 'Marie',
    age: 4,
    enjoys: 'chasing after rabbits',
    image: 'https://dyn1.heritagestatic.com/lf?set=path%5B2%2F3%2F3%2F7%2F2%2F23372557%5D&call=url%5Bfile%3Aproduct.chain%5D',
    image2: '',
    image3: '',
    image4: ''
  }
]

cats.each do |each_cat|
  Cat.create each_cat
  puts "creating cat #{each_cat}"
end
