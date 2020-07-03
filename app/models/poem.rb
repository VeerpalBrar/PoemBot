class Poem < ApplicationRecord
    has_many :votes, dependent: :destroy
    belongs_to :user
    validates_presence_of :content
    paginates_per 2

    def self.search(query)
        attributes = [:title, :content, :author]
        queries = attributes.map { |attr| "#{attr} LIKE '%#{query}%'" }
        where(queries.join(" OR "))
    end 
end
