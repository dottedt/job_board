class CreateJobExperiences < ActiveRecord::Migration
  def change
    create_table :job_experiences do |t|
      t.text :name

      t.timestamps
    end
  end
end
