class Room < ApplicationRecord
    belongs_to :user
    attachment :room_image
    has_many :books
    
    def self.search(search) 
        if search
          where(['title LIKE ?', "%#{search}%"])
        else
          all
        end
    end
end
