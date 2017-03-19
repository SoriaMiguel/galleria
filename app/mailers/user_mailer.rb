class UserMailer < ApplicationMailer

  def signup(user)
   @user = user
   mail(to: @user.email, subject: "Cogratulations on joining Galleria!")
  end

 def share(gallery, email)
   @gallery = gallery
   mail(to: email, subject: "Someone special decided to share this gallery.")
 end

end
