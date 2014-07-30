class RemoveScholarshipIdFromScholarshipPetition < ActiveRecord::Migration
  def change
    remove_column :scholarship_petitions, :scholarship_id
    add_column :scholarship_petitions, :scholarship_type, :string
  end
end
