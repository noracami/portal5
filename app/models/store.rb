class Store < ApplicationRecord
  has_many :comments, dependent: :destroy
end
