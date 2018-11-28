class FakeEmailsController < ApplicationController

  def index
    @fake_emails = FakeEmail.all
  end


end
