class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false, default: ""
      t.string :body, null: false, default: ""
      t.timestamps
    end
  end
end
