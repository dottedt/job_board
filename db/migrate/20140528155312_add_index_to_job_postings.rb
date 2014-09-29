class AddIndexToJobPostings < ActiveRecord::Migration
  def change
    add_index :job_postings, :job_experience_id
    add_index :job_postings, :job_type_id
  end
end
