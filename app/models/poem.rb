class Poem < ApplicationRecord
    has_many :votes, dependent: :destroy
    belongs_to :user
    validates_presence_of :content

end
