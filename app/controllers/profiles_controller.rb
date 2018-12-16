class ProfilesController < ApplicationController
  # GET to /user/:user_id/profile/new
    def new
    # Render blanck profile details form
    @profile = Profile.new
    end
end    