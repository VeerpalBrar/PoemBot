class Poem < ApplicationRecord
    has_many :votes, dependent: :destroy
    validates_presence_of :content

end
