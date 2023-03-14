class Activity < ApplicationRecord
    @allowed_categories = %w(charity cooking music diy education social busywork recreational relaxation)

	validates :name, presence: true
	validates :category, presence: true,
                         inclusion: { in: @allowed_categories, message:  "%{value.capitalize} is not a valid category."}
    validates :participants, presence: true, numericality: { only_integer: true, in: (1..8) }
    validates :price, presence: true, numericality: { in: (0..1)}
    validates :accessibility, presence: true, numericality: { in: (0..1)}
end

