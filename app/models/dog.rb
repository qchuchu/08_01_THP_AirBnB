class Dog < ApplicationRecord
  belongs_to :city
  has_and_belongs_to_many :strolls
end
