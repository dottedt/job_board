class CreateJobSkills < ActiveRecord::Migration
  def change
    create_table :job_skills do |t|
      t.string :name
      t.string :version

      t.timestamps
    end
  end
end
