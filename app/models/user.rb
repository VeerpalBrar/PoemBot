class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :poems
  has_many :votes
  has_many :voted_poems, -> { distinct }, through: :votes, source: :poem

  def has_voted_for?(poem_id)
    voted_poems.find_by(id: poem_id).present?
  end

  def find_vote_for(poem_id)
    votes.find_by(poem_id: poem_id)
  end

  def vote_for(poem_id)
    return Vote.create(user_id: self.id, poem_id: poem_id)
  end
end
