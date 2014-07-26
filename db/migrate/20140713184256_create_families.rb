class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :name
      t.string :dni
      t.string :relationship
      t.string :student_id

      t.timestamps
    end
  end
end
