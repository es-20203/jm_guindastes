require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should save user with cpf, email, password and password_confirmation' do
    user = User.new  cpf: '12345678910', email: 'es@es.com', kind: 'Driver', password: '123456', password_confirmation: '123456'
    assert user.save
  end

  test 'should not save user with password other than password_confirmation' do
    user = User.new  cpf: '12345678910', email: 'es@es.com', kind: 'Driver', password: '123456', password_confirmation: '1234'
    assert_not user.save
  end

  test 'should not save user without cpf' do
    user = User.new  email: 'es@es.com', kind: 'Driver', password: '123456', password_confirmation: '123456'
    assert_not user.save
  end

  test 'should not edit user with email violating format' do
    user = User.new  cpf: '12345678910', email: 'es@.com', kind: 'Driver', password: '123456', password_confirmation: '123456'
    user.save
    assert_not user.update email: 'es.com'
  end
end
