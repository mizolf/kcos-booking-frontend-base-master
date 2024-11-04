class AddBookableTimeToSpaces < ActiveRecord::Migration[5.1]
  def change
  	add_column :spaces, :bookable_from, :integer, default: 0
  	add_column :spaces, :bookable_to, :integer, default: 1440
  end
end
