class Room < ApplicationRecord
    belongs_to :user
    attachment :room_image
    has_many :books
    validates :title, presence: true
   validates :address,  presence: true
   validates :price, numericality: true
end


