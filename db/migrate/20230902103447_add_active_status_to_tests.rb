class AddActiveStatusToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :active, :boolean, null: false, default: false
    add_index :tests, :active
  end
end
