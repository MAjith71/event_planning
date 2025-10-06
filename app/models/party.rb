class Party < ApplicationRecord
    has_many :attendees, dependent: :destroy
    accepts_nested_attributes_for :attendees, allow_destroy: true
end
