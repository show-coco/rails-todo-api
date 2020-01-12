require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: 'show', email: 'show@example.com')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  # ----name----

  test 'name should be present' do
    @user.name = ''
    assert_not @user.valid?
  end

  test 'name should not be too long' do
    @user.name = 'a' * 21
    assert_not @user.valid?
  end

  # ----email----

  test 'email should be present' do
    @user.email = ''
    assert_not @user.valid?
  end

  test 'email should not be too long' do
    @user.email = 'a' * 244 + 'example.com'
    assert_not @user.valid?
  end

  test 'email validation should reject be wrong format email' do
    emails = [ 'aaa@examplecom', 'bbb@example..com', 'ccc@examplecom.' ]
    emails.each do |email|
      @user.email = email
      assert_not @user.valid?
    end
  end
end
