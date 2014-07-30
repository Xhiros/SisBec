class ChangeTypeStartingAndEnding < ActiveRecord::Migration
  def up
    change_table :scholarships do |t|
      t.change :starting, :date
      t.change :ending, :date
    end
  end

  def down
    change_table :scholarships do |t|
      t.change :starting, :string
      t.change :ending, :string
    end
  end
end
