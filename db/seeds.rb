# Add seed data here. Seed your database with `rake db:seed`
Song.destroy_all
Genre.destroy_all
Artist.destroy_all
SongGenre.destroy_all
LibraryParser.new.call