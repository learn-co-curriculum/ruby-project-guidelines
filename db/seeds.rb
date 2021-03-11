Theater.destroy_all
Guest.destroy_all
Genre.destroy_all
Movie.destroy_all
Ticket.destroy_all



commando=Theater.create(name: "Commando Theater")

rom_com=Genre.create(genre: ("Romantic Comedy").colorize(:cyan))
action=Genre.create(genre: ("Action").colorize(:cyan))
sci_fi=Genre.create(genre: ("Science Fiction").colorize(:cyan))
slasher=Genre.create(genre: ("Slasher").colorize(:cyan))

donovan = Guest.create(name: "theater", password: "123")
g1=Guest.create(name: "Hadi", password: "123")
g2=Guest.create(name: "Donovan", password: "123")
g3=Guest.create(name: "Drake", password: "123")
g4=Guest.create(name: "Sonny", password: "123")
g5=Guest.create(name: "Shrek", password: "123")
g6=Guest.create(name: "Neo", password: "123")
g7=Guest.create(name: "Trinity", password: "123")
g8=Guest.create(name: "P.Rudd", password: "123")
g9=Guest.create(name: "Jackie Chan", password: "123")
g10=Guest.create(name: "Bagheera", password: "123")

m1 = Movie.create(title: ("Groundhog Day").colorize(:light_blue), genre_id: rom_com.id, showtime: 6, theater_id: commando.id )
m2 = Movie.create(title: ("Clueless").colorize(:light_blue),  genre_id: rom_com.id, showtime: 3, theater_id: commando.id)
m3 = Movie.create(title: ("Sleepless in Seattle").colorize(:light_blue),  genre_id: rom_com.id, showtime: 11, theater_id: commando.id)
m4 = Movie.create(title: ("Rush Hour").colorize(:light_blue),  genre_id: action.id, showtime: 4, theater_id: commando.id)
m5 = Movie.create(title: ("The Matrix").colorize(:light_blue),  genre_id: action.id, showtime: 12, theater_id: commando.id)
m6 = Movie.create(title: ("Inside Man").colorize(:light_blue),  genre_id: action.id, showtime: 6, theater_id: commando.id )
m7 = Movie.create(title: ("Mars Attacks").colorize(:light_blue),  genre_id: sci_fi.id, showtime: 9, theater_id:commando.id )
m8 = Movie.create(title: ("Predator").colorize(:light_blue),  genre_id: sci_fi.id, showtime: 12, theater_id: commando.id )
m9 = Movie.create(title: ("Jurassic Park").colorize(:light_blue),  genre_id: sci_fi.id, showtime: 4, theater_id: commando.id )
m10 = Movie.create(title: ("I Know What You Did Last Summer").colorize(:light_blue),  genre_id: slasher.id, showtime: 11, theater_id: commando.id )
m11 = Movie.create(title: ("Scream").colorize(:light_blue),  genre_id: slasher.id, showtime: 12, theater_id: commando.id )
m12 = Movie.create(title: ("Halloween").colorize(:light_blue),  genre_id: slasher.id, showtime: 10, theater_id:commando.id )


t1=Ticket.create(theater_id: commando.id, movie_id: m1.id, guest_id: g1.id)
t2=Ticket.create(theater_id: commando.id, movie_id: m2.id, guest_id: g2.id)
t3=Ticket.create(theater_id: commando.id, movie_id: m3.id, guest_id: g3.id)
t4=Ticket.create(theater_id: commando.id, movie_id: m4.id, guest_id: g4.id)
t5=Ticket.create(theater_id: commando.id, movie_id: m5.id, guest_id: g5.id)
t6=Ticket.create(theater_id: commando.id, movie_id: m6.id, guest_id: g6.id)
t7=Ticket.create(theater_id: commando.id, movie_id: m7.id, guest_id: g7.id)
t8=Ticket.create(theater_id: commando.id, movie_id: m8.id, guest_id: g8.id)
t9=Ticket.create(theater_id: commando.id, movie_id: m9.id, guest_id: g9.id)
t10=Ticket.create(theater_id: commando.id, movie_id: m10.id, guest_id: g10.id)
t11=Ticket.create(theater_id: commando.id, movie_id: m11.id, guest_id: g1.id)
t12=Ticket.create(theater_id: commando.id, movie_id: m12.id, guest_id: g1.id)
t13=Ticket.create(theater_id: commando.id, movie_id: m2.id, guest_id: g2.id)
t14=Ticket.create(theater_id: commando.id, movie_id: m2.id, guest_id: g2.id)
t15=Ticket.create(theater_id: commando.id, movie_id: m3.id, guest_id: g4.id)
t16=Ticket.create(theater_id: commando.id, movie_id: m9.id, guest_id: g5.id)
t17=Ticket.create(theater_id: commando.id, movie_id: m11.id, guest_id: g5.id)

