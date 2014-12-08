class CreateDiseases < ActiveRecord::Migration
  def change
    create_table :diseases do |t|
   
      t.string :diseases_name
      t.string :symptoms
      t.timestamps
    end
  end
end
