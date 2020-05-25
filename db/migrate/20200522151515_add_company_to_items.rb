class AddCompanyToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :company, :string
  end
end
