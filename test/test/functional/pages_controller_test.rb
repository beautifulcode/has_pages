require 'test_helper'

class PagesControllerTest < ActionController::TestCase

   test "should get home" do
     get :home
     assert_response :success
     assert_template 'pages/home'
   end

   test "should get subdirectory" do
     get 'foo/bar'
     assert_template 'pages/foo/bar'
   end

   test "should get sub-sub-directory" do
     get 'foo/bar/baz'
     assert_template 'pages/foo/bar/baz'
   end

   test "should cache requested file in public directory" do
     get 'foo'
     assert_file_exists 'public/foo.html'
   end

end
