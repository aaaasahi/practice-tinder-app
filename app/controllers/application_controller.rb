class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller? #devise_controller使用時before実行

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up,keys:[:name,:gender]) #sign_up時にkeyを許可
    
        devise_parameter_sanitizer.permit(:account_update, keys:[:name,:self_introduction])
    end

end
