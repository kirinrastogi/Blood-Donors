require 'sqlite3'

db = SQLite3::Database.open './db/development.sqlite3'

def getBloodType()
  case rand(8)
  when 0
    "o+"
  when 1
    "o-"
  when 2
    "a+"
  when 3
    "a-"
  when 4
    "b+"
  when 5
    "b-"
  when 6
    "ab+"
  else
    "ab-"
  end
end

begin 
  100.times do |id|
    puts id
    db.execute "insert into donors values (#{id}, 'donName#{id}', 'email#{id}', '#{getBloodType()}', '#{Time.now}', '#{Time.now}');"
    db.execute "insert into recipients values (#{id}, 'recName#{id}', 'email#{id}', '#{getBloodType()}', '#{Time.now}', '#{Time.now}');"
  end

  puts 'creating transactions'
  50.times do |id|
    puts id
    db.execute "insert into transactions values ('#{id}', '#{rand(100)}', '#{rand(100)}', '#{Time.now}', '#{Time.now}');"
  end
rescue SQLite3::Exception => e
  puts e.message
  puts 'run this from root location'
ensure
  db.close
end
