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

100.times do |id|
  puts id
  Donor.create(id: id, name: "donName#{id}", email: "donEmail#{id}", blood_type: getBloodType())
  Recipient.create(id: id, name: "recName#{id}", email: "recEmail#{id}", blood_type: getBloodType())
end

puts "creating transactions"
50.times do |id|
  puts id
  Transaction.create(id: id, donor_id: rand(100), recipient_id: rand(100))
end
