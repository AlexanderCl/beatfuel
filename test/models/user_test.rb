require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  test "Users attributes must not be empty" do
    u = User.new
    assert user.invalid?
    assert user.errors[:slogan].any?
    assert user.errors[:musicgenre].any?
    assert user.errors[:about].any?
  end

  def new_user(image_url)
    User.new(:slogan => "Dit is een slogan",
            :musicgenre => "Dubstep, Hiphop",
            :about => "hahahahahhahahahahahahahahahhahahahaha",
            :image_url => image_url)
  end

  test "image_url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif}
   bad = %w{ fred.doc fred.gif/more fred.gif.more }

    ok.each do |name| assertnew_user(name).valid?, "#{name} shouldn't be invalid"
    end
    bad.each do |name| assertnew_product(name).invalid?, "#{name}shouldn't be valid"
    end
  end
