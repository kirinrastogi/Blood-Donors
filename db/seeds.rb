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

SIZE = 100
DONATION_SIZE = SIZE * 3
NURSE_SIZE = SIZE / 20

puts 'Creating donors and recipients and nurses'
SIZE.times do |id|
  Donor.create(id: id, name: "donName#{id}", email: "don#{id}@email.com", blood_type: getBloodType)
  Recipient.create(id: id, name: "recName#{id}", email: "rec#{id}@email.com", blood_type: getBloodType)
  if id < NURSE_SIZE
    Nurse.create(id: id, name: "nurse#{id}", email: "nurseEmail#{id}@email.com")
  end
end

puts "Creating donations and present_nurses"
DONATION_SIZE.times do |id|
  Donation.create(id: id, donor_id: rand(SIZE), recipient_id: rand(SIZE))
  if id < NURSE_SIZE
    PresentNurse.create(id: id, donation_id: rand(DONATION_SIZE), nurse_id: rand(NURSE_SIZE))
  end
end
