class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|

      t.integer :user_id
      t.string :name
      t.integer :ph_number
      t.string :reason
      t.string :address
      t.date   :appointment_date
      t.integer :doctor_id
      
      t.timestamps
    end
  end
end
