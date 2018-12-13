class AddReviewCountToBars < ActiveRecord::Migration[5.1]
  def change
    add_column :bars, :reviews_count, :integer
  end
end
