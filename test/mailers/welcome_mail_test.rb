require 'test_helper'

class WelcomeMailTest < ActionMailer::TestCase
   test "the truth" do
     assert true
   end
   test "notify_registered_user" do
   mail = WelcomeMail.welcome_email
   assert_equal "notify_registered_user" , mail.subject
   assert_equal ["abcd@123.com"] , mail.to
   assert_equal ["kulkarni.trupti.v.19@gmail.com"] , mail.from
   assert_equal "Hello" , mail.body.encoded
   end
   
   def welcome_email_preview
        @user = user
       # @url  = "http://example.com/login"
        mail(:to => @user.Email_id, :subject => "Welcome to My Awesome Site")
   end 
   
end
