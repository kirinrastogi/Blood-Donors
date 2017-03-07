rails g model Donor name email blood_type

rails g model Recipient name email blood_type

rails g model Nurse name email

rails g model Transaction donor:references:index recipient:references:index

rails g model PresentNurse transaction:references:index nurse:references:index
