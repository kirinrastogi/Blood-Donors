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

puts 'Creating donors and recipients'
Donor.create(id: 100, name: 'firstName', email: 'firstEmail', blood_type: 'o-')
100.times do |id|
  Donor.create(id: id, name: "donName#{id}", email: "donEmail#{id}", blood_type: getBloodType())
  Recipient.create(id: id, name: "recName#{id}", email: "recEmail#{id}", blood_type: getBloodType())
end

puts "Creating donations"
50.times do |id|
  Donation.create(id: id, donor_id: rand(100), recipient_id: rand(100))
end
