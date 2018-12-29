class AddTitleToPoems < ActiveRecord::Migration[5.0]
  def change
    add_column :poems, :title, :string
  end
end
