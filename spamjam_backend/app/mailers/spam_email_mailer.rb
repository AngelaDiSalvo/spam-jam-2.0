class SpamEmailMailer < ApplicationMailer
  default from: 'test@example.com'

  def punch1(victim, spam, user)

    @victim = victim
    @spam_email = spam
    @user = user
    mg_client = Mailgun::Client.new(ENV['my_api_key'])#FIND A WAY TO REFERENCE THIS FROM SOMEWHERE
    mg_client.send_message("everscrolls.com", {from: Faker::Internet.email,to: @victim.real_email, subject: Faker::BackToTheFuture.quote, html: @spam_email.contents})
    # mail(from: @user.real_email,to: @victim.real_email, subject: "test", text: @spam_email.contents)
  end

  def multipunch(int, victim, spam, user)

    int.times do
      #sleep(5)

      punch1(victim, spam, user)
    end
  end
end
