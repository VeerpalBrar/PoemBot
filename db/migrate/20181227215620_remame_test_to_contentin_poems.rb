class RemameTestToContentinPoems < ActiveRecord::Migration[5.0]
  def change
    rename_column :poems, :test, :content
  end
end
