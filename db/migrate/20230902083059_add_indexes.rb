class AddIndexes < ActiveRecord::Migration[6.1]
  def change
    add_index :tests, %i[title level], unique: true
    add_index :test_passages, :correct_questions
    add_index :users, :email
    add_index :categories, :title
    add_index :gists, :url
  end
end
