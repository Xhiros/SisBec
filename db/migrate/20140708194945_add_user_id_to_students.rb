class AddUserIdToStudents < ActiveRecord::Migration
  def change
    add_column :students, :user_id, :string
  end
end
