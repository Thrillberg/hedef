class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.string :status
      t.string :content
    end
  end
end
