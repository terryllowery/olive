class AddIndexBackToSections < ActiveRecord::Migration[5.0]
  def change
    add_index :sections, :course_id
  end
end
