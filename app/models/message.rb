require 'houston'

class Message < ActiveRecord::Base
  belongs_to :device, :foreign_key => "receiver_id"
  
  after_create :sendPush
  
  def sendPush
    apn = Houston::Client.development
    apn.certificate = self.device.app.certificate
    token = self.device.token
    notification = Houston::Notification.new(device: token)
    notification.alert = self.title
    notification.badge = 0
    if self.badge?
      notification.badge = self.badge
    end
    
    if !self.sound.blank?
      notification.sound = self.sound
    end

    # notification.category = "INVITE_CATEGORY"
    notification.content_available = true
    
    if !self.url.blank? 
       notification.custom_data = {id: "#{self.id.to_s}", url: self.url }
    else
       notification.custom_data = {id: "#{self.id.to_s}" }   
    end

    apn.push(notification)
    
    self.sent = 1
    self.save
  end
end
