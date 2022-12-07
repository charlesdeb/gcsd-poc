# rows for en locale
I18n.locale = en
User.where({"email"=>"chabekah@gmail.com", "first_name"=>"Charles", "last_name"=>"de Bueger", "role"=>"user", "time_zone"=>"London", "locale"=>"tr"}).first_or_create!
SessionType.where({"name"=>"Plenary", "description"=>"Keynote session for allcomers", "order_by"=>10}).first_or_create!
SessionType.where({"name"=>"Workshops", "description"=>"xxx", "order_by"=>10}).first_or_create!
Page.where({"title"=>"Home", "slug"=>"home"}).first_or_create!
Page.where({"title"=>"About", "slug"=>"about"}).first_or_create!
Event.where({"title"=>"GCSD April 2022", "starting_at"=>Sun, 10 Apr 2022 07:00:00.000000000 UTC +00:00, "status"=>"published", "is_featured"=>false, "slug"=>"gcsd-april-2022", "finishing_at"=>Mon, 04 Apr 2022 22:00:00.000000000 UTC +00:00}).first_or_create!
Event.where({"title"=>"GCSD October 2023", "starting_at"=>Sat, 08 Apr 2023 07:00:00.000000000 UTC +00:00, "status"=>"published", "is_featured"=>true, "slug"=>"gcsd-april-2023", "finishing_at"=>Sat, 08 Apr 2023 22:00:00.000000000 UTC +00:00}).first_or_create!
Session.where({"limit"=>nil, "event_id"=>1, "session_type_id"=>1}).first_or_create!
Session.where({"limit"=>nil, "event_id"=>1, "session_type_id"=>2}).first_or_create!
Session.where({"limit"=>nil, "event_id"=>1, "session_type_id"=>1}).first_or_create!

# rows for tr locale
I18n.locale = tr
User.where({"email"=>"chabekah@gmail.com", "first_name"=>"Charles", "last_name"=>"de Bueger", "role"=>"user", "time_zone"=>"London", "locale"=>"tr"}).first_or_create!
SessionType.where({"name"=>"Plenary", "description"=>"Keynote session for allcomers", "order_by"=>10}).first_or_create!
SessionType.where({"name"=>"Workshops", "description"=>"xxx", "order_by"=>10}).first_or_create!
Page.where({"title"=>"Ev", "slug"=>"home"}).first_or_create!
Page.where({"title"=>"Hakkında", "slug"=>"about"}).first_or_create!
Event.where({"title"=>"KYSG Nisan 2022", "starting_at"=>Sun, 10 Apr 2022 07:00:00.000000000 UTC +00:00, "status"=>"published", "is_featured"=>false, "slug"=>"gcsd-april-2022", "finishing_at"=>Mon, 04 Apr 2022 22:00:00.000000000 UTC +00:00}).first_or_create!
Event.where({"title"=>"KYSG Ekim 2023", "starting_at"=>Sat, 08 Apr 2023 07:00:00.000000000 UTC +00:00, "status"=>"published", "is_featured"=>true, "slug"=>"gcsd-april-2023", "finishing_at"=>Sat, 08 Apr 2023 22:00:00.000000000 UTC +00:00}).first_or_create!
Session.where({"limit"=>nil, "event_id"=>1, "session_type_id"=>1}).first_or_create!
Session.where({"limit"=>nil, "event_id"=>1, "session_type_id"=>2}).first_or_create!
Session.where({"limit"=>nil, "event_id"=>1, "session_type_id"=>1}).first_or_create!

# rows for fr locale
I18n.locale = fr
User.where({"email"=>"chabekah@gmail.com", "first_name"=>"Charles", "last_name"=>"de Bueger", "role"=>"user", "time_zone"=>"London", "locale"=>"tr"}).first_or_create!
SessionType.where({"name"=>"Plenary", "description"=>"Keynote session for allcomers", "order_by"=>10}).first_or_create!
SessionType.where({"name"=>"Workshops", "description"=>"xxx", "order_by"=>10}).first_or_create!
Page.where({"title"=>nil, "slug"=>"home"}).first_or_create!
Page.where({"title"=>nil, "slug"=>"about"}).first_or_create!
Event.where({"title"=>"JM du SC Avril 2022", "starting_at"=>Sun, 10 Apr 2022 07:00:00.000000000 UTC +00:00, "status"=>"published", "is_featured"=>false, "slug"=>"gcsd-april-2022", "finishing_at"=>Mon, 04 Apr 2022 22:00:00.000000000 UTC +00:00}).first_or_create!
Event.where({"title"=>"JM du SC Octobre 2023", "starting_at"=>Sat, 08 Apr 2023 07:00:00.000000000 UTC +00:00, "status"=>"published", "is_featured"=>true, "slug"=>"gcsd-april-2023", "finishing_at"=>Sat, 08 Apr 2023 22:00:00.000000000 UTC +00:00}).first_or_create!
Session.where({"limit"=>nil, "event_id"=>1, "session_type_id"=>1}).first_or_create!
Session.where({"limit"=>nil, "event_id"=>1, "session_type_id"=>2}).first_or_create!
Session.where({"limit"=>nil, "event_id"=>1, "session_type_id"=>1}).first_or_create!

