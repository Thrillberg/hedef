class RemoveSummaryModel < ActiveRecord::Migration
  def change
    drop_table :summaries
  end
end
