class AddImagesToParks < ActiveRecord::Migration
  def change
    add_column :parks, :image, :string
  end
end
