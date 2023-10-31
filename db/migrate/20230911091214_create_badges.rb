class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :name, null: false, default: "", unique: true
      t.string :image_name, null: false, default: "", unique: true
      t.string :criterion, null: false, default: "", unique: true

      t.timestamps
    end
  end
end
