module OmniLog
  class Log < ApplicationRecord
    enum severity: %w(DEBUG ERROR FATAL INFO UNKNOWN WARN)

    validates_presence_of :trace_id, :occurred_at

    before_validation :set_initial_attrs, on: :create

    private
      def set_initial_attrs
        self.occurred_at ||= DateTime.now
        self.severity ||= "INFO"
      end
  end
end
