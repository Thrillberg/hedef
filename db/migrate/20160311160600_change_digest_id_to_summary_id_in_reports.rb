class ChangeDigestIdToSummaryIdInReports < ActiveRecord::Migration
  def change
    rename_column :reports, :digest_id, :summary_id
  end
end
