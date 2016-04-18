class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.string :link
      t.string :viewed, default: 0

      t.timestamps null: false
    end
  end
end
