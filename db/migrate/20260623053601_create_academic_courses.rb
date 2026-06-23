class CreateAcademicCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :academic_courses do |t|
      t.integer :user_id, null: false
      t.string :course_name, null: false
      t.string :course_code
      t.timestamps
    end
    add_index :academic_courses, :user_id
  end
end