class Device < ActiveRecord::Base
  belongs_to :app
  has_many  :messages
  self.primary_key = 'identifier'
end