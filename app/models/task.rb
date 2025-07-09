class Task < ApplicationRecord
  belongs_to :category

  validates :name, presence: true
  validates :deadline, presence: true
end
