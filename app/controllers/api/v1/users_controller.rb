module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate, only: :create

      def create
        user = User.new(users_params)

        if user.save
          jwt = JwToken.encode({user: user.id})

          render json: { jwt: jwt }, status: 201
        else
          render json: { errors: user.errors.full_messages}, status: 422
        end
      end

      private

      def users_params
        params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
      end
    end
  end
end
