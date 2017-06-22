require 'test_helper'

class DoctorTest < ActiveSupport::TestCase
 include Devise::TestHelpers
   test "the truth" do
     assert true
   end
   def setup
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in FactoryGirl.create(:admin)
  end
   test "must not save a doctor when doctor name and email are not provided" do
   doctor = Doctor.new(dname: "John",email: "john.davidson@email.ie")
   assert_equal(false, doctor.save, "saved the doctor even though at least one of the name, and/or email were not provided!")
   assert
   end
end
