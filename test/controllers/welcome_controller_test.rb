require 'test_helper'

# testing welcome controller
class WecomeController < ActionDispatch::IntegrationTest
  test 'should get index' do
    get '/'
    welcome = JSON.parse(@response.body)
    assert_equal "hi there", welcome['welcome']
    assert_response :success
  end
end
