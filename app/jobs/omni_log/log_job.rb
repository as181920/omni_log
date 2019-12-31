module OmniLog
  class LogJob < ApplicationJob
    queue_as :low

    def perform(attrs={})
      Log.create! attrs
    end
  end
end
