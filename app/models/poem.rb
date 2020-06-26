class Poem < ApplicationRecord
    has_many :votes, dependent: :destroy
    belongs_to :user
    validates_presence_of :content
    paginates_per 2
end
