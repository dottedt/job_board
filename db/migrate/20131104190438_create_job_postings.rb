class CreateJobPostings < ActiveRecord::Migration
  def change
    create_table :job_postings do |t|
      t.integer :job_experience_id
      t.integer :type
      t.integer :job_type_id
      t.text :title
      t.boolean :relocation
      t.boolean :remote
      t.boolean :freelance
      t.text :would_have_done
      t.text :compensation
      t.text :nice_to_have

      t.timestamps
    end
  end
end
