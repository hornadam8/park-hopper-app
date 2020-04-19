class CreateParks < ActiveRecord::Migration
  
  def change
    create_table :parks do |t|
      t.string :name
      t.string :link
      t.string :location
      t.string :description
      t.string :information
      t.string :weather
      t.string :tours_and_camping
      t.string :wildlife
      t.string :nearby_parks
    end
  end

end
