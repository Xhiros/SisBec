class CreateScholarshipPetitions < ActiveRecord::Migration
  def change
    create_table :scholarship_petitions do |t|
      t.string :student_id
      t.string :scholarship_id
      t.boolean :approved

      t.timestamps
    end
  end
end
