class Activity < ApplicationRecord
    @allowed_categories = %w(charity cooking music diy education social busywork recreational relaxation)

    has_many :comments
    
    validates :name, presence: true
	validates :category, inclusion: { in: @allowed_categories, message:  "%{value.capitalize} is not a valid category."}, allow_blank: true
    validates :participants, numericality: { only_integer: true, in: (1..8) }, allow_blank: true
    validates :price, numericality: { in: (0..1)}, allow_blank: true
    validates :accessibility, numericality: { in: (0..1)}, allow_blank: true
end

