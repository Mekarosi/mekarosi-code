class ProfilesController < ApplicationController
  # GET to /user/:user_id/profile/new
    def new
      # Render blanck profile details form
      @profile = Profile.new
    end
    
    # POST to /users/:user_id/profile
    def create
    # Ensure that we have the user who is filling out form
      @user = User.find( params[:user_id] )
    # Create profile linked to this specific user
      @profile = @user.build_profile( profile_param )
        if @profile.save
          flash[:success] = "profile updated!"
          redirect_to user_path( params[:user_id] )
        else
          render action: :new
        end    
     end   
     
  Private
    def profile_params
      params.require (:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description )
    end  