module OmniLog
  class ApiLogJob < ApplicationJob
    queue_as :low

    def perform(attrs={})
      ApiLog.create! attrs
    end
  end
end
