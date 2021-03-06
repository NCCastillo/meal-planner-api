module Api
  module V1
    class MenusController < ApplicationController
      def create
        menu = Menu.new(menus_params)
        menu.user_id = current_user.id

        if menu.save
          render json: menu, status: 201
        else
          render json: { errors: menu.errors.full_messages}, status: 422
        end
      end

      def current_menu
        current_menu = current_user.current_menu

        render json: current_menu
      end

      private

      def menus_params
        params.require(:menu).permit(:week_of)
      end
    end
  end
end
