FactoryGirl.define do
  factory :message do
    receiver_id 1
sender_id 1
category ""
title "MyString"
question "MyString"
reply "MyString"
deleted false
sent false
received false
red false
  end

end
