class RemoveCriterionFromBadges < ActiveRecord::Migration[6.1]
  def change
    remove_column :badges, :criterion
  end
end
