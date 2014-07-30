class AddTypeToScholarship < ActiveRecord::Migration
  def change
    add_column :scholarships, :scholarship_type, :string
  end
end
