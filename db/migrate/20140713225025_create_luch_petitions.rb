class CreateLuchPetitions < ActiveRecord::Migration
  def change
    create_table :luch_petitions do |t|
      t.string :student_id

      t.timestamps
    end
  end
end
