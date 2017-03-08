class PresentNurse < ApplicationRecord
  belongs_to :donations
  belongs_to :nurse
end
