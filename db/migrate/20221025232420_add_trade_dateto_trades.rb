class AddTradeDatetoTrades < ActiveRecord::Migration[7.0]
  def change
    add_column :trades, :trade_date, :datetime
  end
end
