class ChangeColumnNames < ActiveRecord::Migration
  def change
     rename_column :job_postings, :experience, :job_experience_id
     rename_column :job_postings, :category, :job_type_id
  end
end
