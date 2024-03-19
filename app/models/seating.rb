class Prototype < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :user_id
    validates :pattern
  end
end
