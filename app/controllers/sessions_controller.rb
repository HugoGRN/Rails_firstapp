class SessionsController < ApplicationController

   def new
       
   end 

   def create
       user = User.find_by(email: params[:session][:email].downcase)
       if user && user.authenticate(params[:session][:password])
            flash[:succes] = "Le retour de l'élu !"
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:danger] = "C'est pas carré morray"
            render 'new'
       end
   end

   def destroy
       session[:user_id] = nil
       flash[:succes] = "C'est ça casse toi"
       redirect_to home_path
   end

end