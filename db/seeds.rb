# frozen_string_literal: true

# This file is of little value. Or at least needs to be rethought out...

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

I18n.locale = :en

# create users
User
  .where('email' => 'chabekah@gmail.com',
         'first_name' => 'Charles',
         'last_name' => 'de Bueger', 'role' => 'user',
         'time_zone' => 'London', 'locale' => 'en')
  .first_or_create!

# create Session Types
plenary_session_type = SessionType
                       .where({
                                'name' => 'Plenary',
                                'description' => 'Come and be inspired by people using their art in a whole range of different ways',
                                'order_by' => 10
                              })
                       .first_or_create!

workshop_session_type = SessionType
                        .where({
                                 'name' => 'Workshops',
                                 'description' => 'Hands-on workshop sessions where everyone gets to play!',
                                 'order_by' => 10
                               })
                        .first_or_create!

# Pages
p = Page
    .where({
             'title' => 'Home', 'slug' => 'home'
           })
    .first_or_create!

p.body = '<div class="trix-content"><div>this is the home page</div></div>'
p.save!

p = Page
    .where({
             'title' => 'About', 'slug' => 'about'
           }).first_or_create!

p.body = '<div class="trix-content"><div>The about page</div></div>'
p.save!

# Events
e = Event
    .where({
             'title' => 'GCSD April 2022', 'starting_at' => 'Sun, 10 Apr 2022 07:00:00.000000000 UTC +00:00',
             'status' => 'published', 'is_featured' => false,
             'slug' => 'gcsd-april-2022',
             'finishing_at' => 'Mon, 04 Apr 2022 22:00:00.000000000 UTC +00:00'
           })
    .first_or_create!

e.description = '<div class="trix-content"><div>We are so excited for our first <strong>GLOBAL CREATIVE STUDIO DAY!</strong><br><br>God has been moving, calling artists in both professional and recreational forms to create beauty for connection, meditation, healing, freedom, and ultimately to bring Him praise.<br><br>The  day is hosted by a community of Christians from all walks of life with virtual and physical studios that meet around the world, welcoming creatives from further afield. For the first time, we will meet altogether while opening the virtual doors to others around the world. So we welcome you to a day of using creativity, in its many forms, as we focus on the theme of <strong>Restoration</strong> to explore the Christian faith.<br><br>After registering, you will then details to join us over Zoom and Discord for a day of meditation, creative and communal worship, workshops, and artist talks.</div></div>'
e.save!

s = Session
    .where({
             id: 1, event_id: e.id, session_type_id: workshop_session_type.id
           })
    .first_or_create!

s.title = 'Listen Up Everyone'
s.description = 'Someone is going to talk about something interesting for 50 minutes'
s.save!

s = Session
    .where({
             id: 2, event_id: e.id, session_type_id: workshop_session_type.id
           })
    .first_or_create!

s.title = 'Guitar Playing for Dummies'
s.description = 'Play like Eric Clapton in 20 minutes'
s.save!

s = Session
    .where({
             id: 3, event_id: e.id, session_type_id: plenary_session_type.id
           })
    .first_or_create!

s.title = 'Art for God\'s Sake'
s.description = 'Using our art for God\'s glory rather than our own'
s.save!

e = Event
    .where({
             'title' => 'GCSD October 2023', 'starting_at' => 'Sat, 08 Apr 2023 07:00:00.000000000 UTC +00:00',
             'status' => 'published', 'is_featured' => true,
             'slug' => 'gcsd-april-2023',
             'finishing_at' => 'Sat, 08 Apr 2023 22:00:00.000000000 UTC +00:00'
           })
    .first_or_create!

e.description = '<div class="trix-content"><div>Description of GCSD 2023</div></div>'
e.save!

I18n.locale = :tr

Page
  .where({
           'title' => 'Ev', 'slug' => 'home',
           'body' => '<div class="trix-content">Bu biraz Türkçe</div>'
         })
  .first_or_create!
Page
  .where({
           'title' => 'Hakkında', 'slug' => 'about',
           'body' => '<div class="trix-content"><div>Bu <em>hakkında</em> sayfası</div></div>'
         })
  .first_or_create!

Event
  .where({
           'title' => 'KYSG Nisan 2022', 'starting_at' => 'Sun, 10 Apr 2022 07:00:00.000000000 UTC +00:00',
           'status' => 'published', 'is_featured' => false,
           'slug' => 'gcsd-april-2022',
           'finishing_at' => 'Mon, 04 Apr 2022 22:00:00.000000000 UTC +00:00',
           'description' => "<div class='trix-content'><div>İlk <strong>KÜRESEL YARATICI STÜDYO GÜN</strong>ümüz için çok heyecanlıyız!<br><br>Tanrı hareket ediyor, hem profesyonel hem de eğlence amaçlı sanatçıları bağlantı, meditasyon, şifa, özgürlük ve nihayetinde O'nu övmek için güzellik yaratmaya çağırıyor.<br><br>Gün, dünyanın her yerinden bir araya gelen sanal ve fiziksel stüdyolarla hayatın her kesiminden bir Hıristiyan topluluğu tarafından barındırılıyor ve daha uzaklardan yaratıcıları ağırlıyor. İlk kez sanal kapıları dünyanın dört bir yanından insanlara açarken hep birlikte buluşacağız. Hıristiyan inancını keşfetmek için <strong>Restorasyon</strong> temasına odaklanırken, sizi yaratıcılığın birçok biçiminde kullanacağınız bir güne hoş geldiniz.<br><br>Kaydolduktan sonra, meditasyon, yaratıcı ve toplu ibadet, atölye çalışmaları ve sanatçı konuşmalarıyla dolu bir gün için Zoom ve Discord üzerinden bize katılmanın ayrıntılarını alacaksınız.</div></div>"
         })
  .first_or_create!

Event
  .where({
           'title' => 'KYSG Ekim 2023', 'starting_at' => 'Sat, 08 Apr 2023 07:00:00.000000000 UTC +00:00',
           'status' => 'published', 'is_featured' => true,
           'slug' => 'gcsd-april-2023',
           'finishing_at' => 'Sat, 08 Apr 2023 22:00:00.000000000 UTC +00:00',
           'description' => 'xx'
         })
  .first_or_create!

I18n.locale = :fr

Event
  .where({
           'title' => 'JM du SC Avril 2022', 'starting_at' => 'Sun, 10 Apr 2022 07:00:00.000000000 UTC +00:00',
           'status' => 'published', 'is_featured' => false,
           'slug' => 'gcsd-april-2022',
           'finishing_at' => 'Mon, 04 Apr 2022 22:00:00.000000000 UTC +00:00',
           'description' => "<div class='trix-content'><div>Nous sommes tellement enthousiastes pour cette première <strong>JOURNÉE MONDIALE DU STUDIO CRÉATIF GLOBAL<br><br></strong>Dieu a agi, appelant des artistes sous des formes professionnelles et récréatives pour créer de la beauté pour la connexion, la méditation, la guérison, la liberté et, finalement, pour Lui apporter des louanges.<br><br>La journée est animée par une communauté de chrétiens de tous horizons avec des studios virtuels et physiques qui se réunissent dans le monde entier, accueillant des créatifs de plus loin. Pour la première fois, nous nous rencontrerons ensemble tout en ouvrant les portes virtuelles à d'autres dans le monde. Nous vous invitons donc à une journée d'utilisation de la créativité, sous ses nombreuses formes, alors que nous nous concentrons sur le thème de la <strong>Restauration</strong> pour explorer la foi chrétienne.<br><br>Après votre inscription, vous aurez ensuite les détails pour nous rejoindre sur Zoom et Discord pour une journée de méditation, de culte créatif et communautaire, d'ateliers et de discussions d'artistes.</div></div>"
         })
  .first_or_create!
Event
  .where({
           'title' => 'JM du SC Octobre 2023', 'starting_at' => 'Sat, 08 Apr 2023 07:00:00.000000000 UTC +00:00',
           'status' => 'published', 'is_featured' => true,
           'slug' => 'gcsd-april-2023',
           'finishing_at' => 'Sat, 08 Apr 2023 22:00:00.000000000 UTC +00:00',
           'description' => 'xx'
         })
  .first_or_create!
