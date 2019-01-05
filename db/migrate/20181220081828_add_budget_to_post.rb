class AddBudgetToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :budget, :integer
  end
end
