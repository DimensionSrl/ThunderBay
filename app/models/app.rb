class App < ActiveRecord::Base
  has_many :devices
  self.primary_key = 'identifier'
  
  def sandbox=
  end
  
  def sandbox
  end
end