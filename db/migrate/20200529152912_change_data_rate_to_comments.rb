class ChangeDataRateToComments < ActiveRecord::Migration[6.0]
  def change
    change_column :comments, :rate, :float
  end
end