class CreateTrips < ActiveRecord::Migration

  def change
    create_table :trips do |t|
      t.string :review
      t.date :visit_date
      t.integer :user_id
      t.integer :park_id
    end
  end
  
end
