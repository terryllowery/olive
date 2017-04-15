class AlterSectionTableChangeSectionToTitle < ActiveRecord::Migration[5.0]
  def change
    change_table :sections do |t|
      t.rename :sections, :title
    end
    remove_index :sections, :course_id
  end
end
