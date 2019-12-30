module OmniLog
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true

    connects_to database: {writing: :timescale, reading: :timescale}
  end
end
