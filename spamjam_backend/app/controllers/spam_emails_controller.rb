class SpamEmailsController < ApplicationController
  before_action :set_spam_email, only: [:show]

  def index
    @spam_emails = SpamEmail.all
  end

  def show
  end

  def new1
  end

  def new
    session[:spam_type_id] = params[:spam_type_id]
    redirect_to '/new/2'
  end

  def dog
    @spam_type = SpamType.find(session[:spam_type_id])
    @spam_email = SpamEmail.new

    render :new
  end

  def confirm
    render :confirm
  end
  def bam
    render :bam
  end

  def create
    @spam_type = SpamType.find(session[:spam_type_id])
    @user = User.create(name: params[:spam_email][:user_name], real_email: params[:spam_email][:user_real_email])
    @victim = Victim.create(name: params[:spam_email][:victim_name], real_email: params[:spam_email][:victim_real_email])

    @num_emails = params[:spam_email][:num_emails].to_i

    if(@num_emails && @num_emails > 0 && @num_emails <= 50)
      @num_emails.times do
        @spam_email = SpamEmail.create(contents: params[:spam_email][:contents] , user_id: @user.id , victim_id: @victim.id , spam_type_id: @spam_type.id)
      end# Janky way to create # emails based on the form purely for database stuff
    end#makes sure @num_emails is not nil or 0




    respond_to do |format|
      if @spam_email.valid? && @user.valid? && @victim.valid? &&verify_recaptcha(model: @spam_email)
        if !@num_emails.nil? #COME BACK HERE
          #do the thing multipunch
          SpamEmailMailer.multipunch(@num_emails,@victim,@spam_email,@user).deliver_now
          format.html { render :confirm, notice: 'Spam email was successfully created.' }
        else
          SpamEmailMailer.punch1(@victim,@spam_email,@user).deliver_now
          format.html { render :confirm, notice: 'Spam email was successfully created.' }
        end
      else
        format.html { render :new }
      end
    end
  end

  private

    def set_spam_email
      @spam_email = SpamEmail.find(params[:id])
    end

    def spam_email_params
      params.require(:spam_email).permit(:contents, :spam_type_id, :victim_id, :user_id)
    end
end
