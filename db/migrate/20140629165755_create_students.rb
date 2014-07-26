class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :firstName
      t.string :lastName
      t.string :dni
      t.string :career
      t.string :otherCareer
      t.string :fileNumber
      t.string :address
      t.string :department
      t.string :telephone
      t.string :cellphone
      t.string :dwelling
      t.float :rental
      t.string :economicSituation
      t.integer :children
      t.integer :dependent
      t.integer :schoolDays
      t.integer :familyGroup
      t.float :income
      t.integer :minors
      t.string :disabilityOrIllness
      t.text :clarifications
      t.integer :vehicles
      t.string :card_id

      t.timestamps
    end
    add_index :students, :dni,                unique: true
    add_index :students, :fileNumber,         unique: true
  end
end
