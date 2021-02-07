class RegistrationsController < Devise::RegistrationsController

    protected
  
    def update_resource(resource, params) #パスワードなしでプロフィール変更できる
      resource.update_without_current_password(params)
    end

    def after_update_path_for(resource) #プロフィール更新後の
        user_path(resource)
      end

      def after_sign_up_path_for(resource) #ログインしたら
        users_path
      end
  end