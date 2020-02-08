class AddDataToOmniLogApiLogs < ActiveRecord::Migration[6.0]
  def up
    OmniLog::ApplicationRecord.connection.add_column :omni_log_api_logs, :data, :jsonb
    OmniLog::ApplicationRecord.connection.change_column :omni_log_api_logs, :duration, :float
  end

  def down
    OmniLog::ApplicationRecord.connection.remove_column :omni_log_api_logs, :data
    OmniLog::ApplicationRecord.connection.change_column :omni_log_api_logs, :duration, :integer
  end
end
