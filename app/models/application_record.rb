# frozen_string_literal: true

# ApplicationRecord model is inherited by all other models.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
