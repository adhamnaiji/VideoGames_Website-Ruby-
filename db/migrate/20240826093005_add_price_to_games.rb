class AddPriceToGames < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :price, :decimal
  end
end
