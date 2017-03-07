require 'sqlite3'

db = SQLite3::Database.open './db/development.sqlite3'

begin 
  db.execute 'select * from donors' do |row|
    puts row
  end
rescue SQLite3::Exception => e
  puts e.message
  puts 'run this from root location'
ensure
  db.close
end


