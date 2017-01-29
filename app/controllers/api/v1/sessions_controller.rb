module Api
  module V1
    class SessionsController < ApplicationController
      skip_before_action :authenticate, only: :create
      
      def create
        user = User.find_by(email: user_params[:email])

        if user && user.authenticate(user_params[:password])
          jwt = JwToken.encode({user: user.id})

          render json: { jwt: jwt }
        else
          render status: 401, json: { errors: ["Invalid credentials"] }
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
