class Seating < ApplicationRecord
  belongs_to :user
  has_many :students

  with_options presence: true do
    validates :user_id
    validates :pattern
  end
end
