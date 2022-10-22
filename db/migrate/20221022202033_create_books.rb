class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :year
      t.boolean :available
      t.string :genre
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
