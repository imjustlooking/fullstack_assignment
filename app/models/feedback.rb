class Feedback < ApplicationRecord
belongs_to :ratable, polymorphic: true
def as_json(options={})
  super(:only => [:ratable_id, :ratable_type, :rating, :comment])
end
end
