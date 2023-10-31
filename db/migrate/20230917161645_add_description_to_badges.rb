class AddDescriptionToBadges < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :description, :string, null: false, default: ""
  end
end
