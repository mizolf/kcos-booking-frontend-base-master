class CreateLandingPages < ActiveRecord::Migration[5.1]
  def change
    create_table :landing_pages do |t|
      t.string :about_project

      t.timestamps
    end
  end
end
