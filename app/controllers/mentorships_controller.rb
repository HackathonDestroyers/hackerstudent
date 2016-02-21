class MentorshipsController < ApplicationController
  before_action :set_mentorship, only: [:show, :edit, :update, :destroy, :chat, :take]
  before_action :restrict_chat, only: :chat

  layout 'mentorship'
  # GET /mentorships
  def index
    @mentorships = Mentorship.all
  end

  # GET /mentorships/1
  def show
  end

  # GET /mentorships/new
  def new
    @mentorship = Mentorship.new
  end

  # GET /mentorships/1/edit
  def edit
  end

  def chat
  end

  # POST /mentorships
  def create
    Pusher.app_id = '181611'
    Pusher.key = 'b218d16c34fc85f4cebf'
    Pusher.secret = '9d9dac2beb8d05c01e1f'
    @mentorship = Mentorship.new(mentorship_params)
    if @mentorship.save
      Pusher.trigger(@mentorship.language.name, 'student_request',
                     mentorship_id: @mentorship.id,
                     message: "#{@mentorship.student.first_name.titleize} need help with #{@mentorship.language.name}.")
      redirect_to chat_path(@mentorship.id)
    else
      render :new
    end
  end

  def take
    redirect_to hacker_path and return if @mentorship.full?
    @mentorship.hacker = current_hacker
    if @mentorship.save
      redirect_to chat_path(@mentorship.id)
    else
      redirect_to hacker_path
    end
  end

  # PATCH/PUT /mentorships/1
  def update
    if @mentorship.update(mentorship_params)
      redirect_to @mentorship, notice: 'Mentorship was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /mentorships/1
  def destroy
    @mentorship.destroy
    redirect_to mentorships_url, notice: 'Mentorship was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mentorship
    @mentorship = Mentorship.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def mentorship_params
    params.require(:mentorship).permit(:hacker_id, :student_id, :started_at, :ended_at, :hacker_rating, :student_rating, :comment, :language_id)
  end

  def restrict_chat
    if current_student
      redirect_to root_path and return if @mentorship.student != current_student
    elsif current_hacker
      redirect_to root_path and return if @mentorship.hacker != current_hacker
    end
  end
end
