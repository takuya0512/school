class Seating < ApplicationRecord
  belongs_to :user
  has_many :students

  with_options presence: true do
    validates :user_id
    validates :pattern
  end

  def initialize(attributes = {})
    super
    build_default_seating
  end

  private

  def build_default_seating
    ('A'..'F').each do |column|
      (1..6).each do |row|
        students.build(table_code: column, position_code: row) unless students.any? { |student| student.table_code == column && student.position_code == row }
      end
    end
  end
end
