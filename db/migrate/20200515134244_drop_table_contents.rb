class DropTableContents < ActiveRecord::Migration[6.0]
  def change
    drop_table :contents
  end
end
