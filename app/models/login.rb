class Login < ApplicationRecord
  validates :user_id, uniqueness: true
end
