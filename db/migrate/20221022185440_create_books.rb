class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :year
      t.references :user, null: false, foreign_key: true
      t.boolean :available
      t.string :genre

      t.timestamps
    end
  end
end
