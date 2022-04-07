class Buy < ApplicationRecord
  has_one :partner
  belongs_to :user
  belongs_to :item
end
