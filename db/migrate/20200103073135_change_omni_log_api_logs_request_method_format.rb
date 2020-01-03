class ChangeOmniLogApiLogsRequestMethodFormat < ActiveRecord::Migration[6.0]
  def up
    OmniLog::ApplicationRecord.connection.execute "update omni_log_api_logs set request_method = null;"
    OmniLog::ApplicationRecord.connection.change_column :omni_log_api_logs, :request_method, "integer USING (request_method::integer)"
  end

  def down
    OmniLog::ApplicationRecord.connection.change_column :omni_log_api_logs, :request_method, :string
  end
end
