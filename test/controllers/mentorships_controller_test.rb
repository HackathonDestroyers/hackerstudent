require 'test_helper'

class MentorshipsControllerTest < ActionController::TestCase
  setup do
    @mentorship = mentorships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mentorships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mentorship" do
    assert_difference('Mentorship.count') do
      post :create, mentorship: { comment: @mentorship.comment, ended_at: @mentorship.ended_at, hacker_id: @mentorship.hacker_id, hacker_rating: @mentorship.hacker_rating, started_at: @mentorship.started_at, student_id: @mentorship.student_id, student_rating: @mentorship.student_rating }
    end

    assert_redirected_to mentorship_path(assigns(:mentorship))
  end

  test "should show mentorship" do
    get :show, id: @mentorship
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mentorship
    assert_response :success
  end

  test "should update mentorship" do
    patch :update, id: @mentorship, mentorship: { comment: @mentorship.comment, ended_at: @mentorship.ended_at, hacker_id: @mentorship.hacker_id, hacker_rating: @mentorship.hacker_rating, started_at: @mentorship.started_at, student_id: @mentorship.student_id, student_rating: @mentorship.student_rating }
    assert_redirected_to mentorship_path(assigns(:mentorship))
  end

  test "should destroy mentorship" do
    assert_difference('Mentorship.count', -1) do
      delete :destroy, id: @mentorship
    end

    assert_redirected_to mentorships_path
  end
end
