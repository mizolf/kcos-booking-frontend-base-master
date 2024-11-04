class CreateSpaces < ActiveRecord::Migration[5.1]
  def change
    create_table :spaces do |t|
      t.string :name
      t.monetize :book_price
      t.monetize :rent_price
      t.string :surface_area
      t.string :description
      t.boolean :bookable, default: true
      t.boolean :rentable, default: true
      t.boolean :available, default: true

      t.timestamps
    end
  end
end
