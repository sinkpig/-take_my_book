class AddReturnDatetoTrades < ActiveRecord::Migration[7.0]
  def change
    add_column :trades, :return_date, :datetime
  end
end
