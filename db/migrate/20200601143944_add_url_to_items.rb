class AddUrlToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :url, :string
  end
end
