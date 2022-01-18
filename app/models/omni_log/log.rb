module OmniLog
  class Log < ApplicationRecord
    enum :severity, %w(DEBUG ERROR FATAL INFO UNKNOWN WARN), default: :INFO

    validates_presence_of :trace_id, :occurred_at

    before_validation :set_initial_attrs, on: :create

    scope :ordered, -> { order(occurred_at: :asc) }

    private
      def set_initial_attrs
        self.occurred_at ||= DateTime.now.strftime("%F %T.%6N")
      end
  end
end
