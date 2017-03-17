def getBloodType
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

SIZE = 1000

puts 'Creating donors and recipients'
SIZE.times do |id|
  Donor.create(id: id, name: "donName#{id}", email: "don#{id}@email.com", blood_type: getBloodType)
  Recipient.create(id: id, name: "recName#{id}", email: "rec#{id}@email.com", blood_type: getBloodType)
end

puts "Creating donations"
SIZE.times do |id|
  Donation.create(id: id, donor_id: rand(SIZE), recipient_id: rand(SIZE))
end
