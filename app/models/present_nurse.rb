class PresentNurse < ApplicationRecord
  belongs_to :donation
  belongs_to :nurse
end
