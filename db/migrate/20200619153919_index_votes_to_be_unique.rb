class IndexVotesToBeUnique < ActiveRecord::Migration[5.2]
  def change
    add_index :votes, [:poem_id, :user_id], unique: true
  end
end
