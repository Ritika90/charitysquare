class User::RegistrationsController < Devise::RegistrationsController
 before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

   
   def new
    super
   end

   def create
    puts '----------------------------------------------------'
    @params=User.new sign_up_params
    if @params.save
        render json: @params
    else
        #render json: @params.errors.messages
         flash[:errors] = @params.errors.messages
         redirect_to(home_charity_signup_path)
         
      end
   
   end

  # GET /resource/edit
  # def edit
  #   supercla
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

   protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params
     devise_parameter_sanitizer.for(:sign_up) do |u|
     u.permit :email, :password, :password_confirmation, :address
    end
   end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
 
end
