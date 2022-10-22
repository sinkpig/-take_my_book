class DefaultTrueInAvailableBooks < ActiveRecord::Migration[7.0]
  def change
    change_column :books, :available, :boolean, default: true
  end
end
