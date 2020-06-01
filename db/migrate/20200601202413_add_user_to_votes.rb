class AddUserToVotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :votes, :user
  end
end
