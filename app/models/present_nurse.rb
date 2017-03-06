class PresentNurse < ApplicationRecord
  belongs_to :transaction
  belongs_to :nurse
end
