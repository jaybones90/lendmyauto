class ChangeDailyPriceTypeToBigDecimalInVehicles < ActiveRecord::Migration[5.1]
  def change
    change_column :vehicles, :daily_price, :decimal
  end
end
