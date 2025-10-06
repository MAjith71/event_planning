class Party < ApplicationRecord
    has_many :attendees, dependent: :destroy
end
