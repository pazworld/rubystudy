require "test_helper"

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:michael)
  end

  test "profile display" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_select 'h1', text: @user.name
    assert_select 'h1>img.gravatar'
    assert_match @user.microposts.count.to_s, response.body
    assert_select 'div.pagination'
    assert_select 'div.pagination', count: 1
    @user.microposts.paginate(page: 1).each do |micropost|
      assert_match micropost.content, response.body
    end
  end
end

class UsersProfileRelationTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:michael)
    log_in_as @user
    @archer = users(:archer)
    @lana = users(:lana)
  end

  test "following count in home page" do
    @user.follow(@archer)
    @user.follow(@lana)
    get root_path
    assert_select 'strong#following', text: @user.following.count.to_s
  end

  test "followers count in home page" do
    @archer.follow(@user)
    @lana.follow(@user)
    get root_path
    assert_select 'strong#followers', text: @user.followers.count.to_s
  end

  test "following count in profile page" do
    @user.follow(@archer)
    @user.follow(@lana)
    get user_path(@user)
    assert_select 'strong#following', text: @user.following.count.to_s
  end

  test "followers count in profile page" do
    @archer.follow(@user)
    @lana.follow(@user)
    get user_path(@user)
    assert_select 'strong#followers', text: @user.followers.count.to_s
  end
end
