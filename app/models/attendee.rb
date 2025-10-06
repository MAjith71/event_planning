class Attendee < ApplicationRecord
    belongs_to :party
    validates :full_name, :email, :phone, presence: true
end
