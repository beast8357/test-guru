class AddQuestionsCountToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :questions_count, :integer, default: 0
  end
end
