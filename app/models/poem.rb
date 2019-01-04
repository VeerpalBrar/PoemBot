class Poem < ApplicationRecord
    has_many :votes, dependent: :destroy
end
