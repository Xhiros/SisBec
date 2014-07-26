class CreateDocFiles < ActiveRecord::Migration
  def change
    create_table :doc_files do |t|
      t.string :name
      t.text :clarification
      t.string :docOwner
      t.string :student_id

      t.timestamps
    end
  end
end
