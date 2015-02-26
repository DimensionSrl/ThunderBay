class App < ActiveRecord::Base
  has_many :devices
  self.primary_key = 'identifier'
  
  def sandbox=
  end
  
  def sandbox
    if self.environment == "production"
      return false
    else
      return true
    end
  end
end