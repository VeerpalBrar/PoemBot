class CreatePoems < ActiveRecord::Migration[5.0]
  def change
    create_table :poems do |t|
      t.string :author
      t.text :test

      t.timestamps
    end
  end
end
