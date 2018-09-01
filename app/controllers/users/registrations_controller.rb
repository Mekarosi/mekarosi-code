class Users::RegistrationsController < Devise::RegistrationsController
  # Extend default Devise gem behaviour so that
  # users signing up with the pro account (plan ID 2)
  # save with a special Stripe subcription function
  # otherwise Devise signs up user as usual
  
  def create
    super do |resource|
      if params[:plan]
        resource.plan_id = params[:plan]
        if resource.plan_id == 2
          resource.save_with_subscription
        else
          
        end
      end
    end
  end
  end
  