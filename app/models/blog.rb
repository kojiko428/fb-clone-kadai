class Blog < ApplicationRecord
    validates :title, presence: true
    validates :title, length: { in: 1..140 }
    validates :content, length: { in: 1..140 }

    belongs_to :user
end
