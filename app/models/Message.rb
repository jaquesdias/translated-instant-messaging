class Message < ApplicationRecord
  validates_presence_of :description
  validates_presence_of :author
  validates_presence_of :dialect_type
end
