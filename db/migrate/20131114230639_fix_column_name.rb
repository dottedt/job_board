class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :job_postings, :job_types_id, :job_type_id
  end
end
