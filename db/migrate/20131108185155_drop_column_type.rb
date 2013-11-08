class DropColumnType < ActiveRecord::Migration
  def change
    remove_column :job_postings, :type
  end
end
