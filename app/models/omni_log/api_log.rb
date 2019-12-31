module OmniLog
  class ApiLog < ApplicationRecord
    enum severity: [:debug, :error, :fatal, :info, :unknown, :warn]

    validates_presence_of :trace_id, :occurred_at

    before_validation :set_initial_attrs, on: :create

    private
      def set_initial_attrs
        self.occurred_at ||= DateTime.now
        self.severity ||= :info
      end
  end
end
