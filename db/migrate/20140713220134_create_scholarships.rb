class CreateScholarships < ActiveRecord::Migration
  def change
    create_table :scholarships do |t|
      t.string :student_id
      t.string :starting
      t.string :ending

      t.timestamps
    end
  end
end
