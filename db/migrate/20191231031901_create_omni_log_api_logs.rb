class CreateOmniLogApiLogs < ActiveRecord::Migration[6.0]
  def up
    OmniLog::ApplicationRecord.connection.create_table :omni_log_api_logs, id: false do |t|
      t.string :trace_id, null: false, index: true
      t.datetime :occurred_at, null: false
      t.integer :severity
      t.string :app_name, index: true
      t.string :event_name, index: true
      t.string :url
      t.string :request_method
      t.jsonb :request_data
      t.integer :response_status
      t.jsonb :response_data
      t.integer :duration
    end

    OmniLog::ApplicationRecord.connection.execute <<~SQL_END
      SELECT create_hypertable('omni_log_api_logs', 'occurred_at')
    SQL_END
  end

  def down
    OmniLog::ApplicationRecord.connection.drop_table :omni_log_api_logs
  end
end
