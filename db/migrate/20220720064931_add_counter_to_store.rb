class AddCounterToStore < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :comments_count, :integer
  end
end
