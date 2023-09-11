class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :name, null: false, default: ""
      t.string :image_filename, null: false, default: ""

      t.timestamps
    end
  end
end
