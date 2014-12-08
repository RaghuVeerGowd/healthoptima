class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
    	
      t.integer :user_id
      t.string :doctor_name
      t.string :expertise
      t.integer :experience
      t.string :email
      t.string :gender

      t.timestamps
    end
  end
end
