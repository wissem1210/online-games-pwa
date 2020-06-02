
module Api
  module V1
      class GameDevelopersController < ApplicationController
        before_action :authorize_access_request!
        before_action :set_game_developer, only: [:show, :update, :destroy]

      # GET /game_developers
      def index
        @game_developers = GameDeveloper.all

        render json: @game_developers
      end

      # GET /game_developers/1
      def show
        render json: @game_developer
      end

      # POST /game_developers
      def create
        @game_developer = GameDeveloper.new(game_developer_params)

        if @game_developer.save
          render json: @game_developer, status: :created, location: @game_developer
        else
          render json: @game_developer.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /game_developers/1
      def update
        if @game_developer.update(game_developer_params)
          render json: @game_developer
        else
          render json: @game_developer.errors, status: :unprocessable_entity
        end
      end

      # DELETE /game_developers/1
      def destroy
        @game_developer.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_game_developer
          @game_developer = GameDeveloper.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def game_developer_params
          params.require(:game_developer).permit(:username)
        end
    end
  end
end