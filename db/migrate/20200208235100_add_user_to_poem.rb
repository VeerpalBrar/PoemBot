class AddUserToPoem < ActiveRecord::Migration[5.2]
  def change
    add_reference :poems, :user
  end
end
