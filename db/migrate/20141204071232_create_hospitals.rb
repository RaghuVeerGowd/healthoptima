class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      
    	t.string :hospital_name
    	t.string :hospital_address
    	t.string :city
    	t.string :area

      t.timestamps
    end
  end
end
