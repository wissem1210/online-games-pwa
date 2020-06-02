module Api
  module V1
    class GamesController < ApplicationController
      before_action :authorize_access_request!, except: [:show, :index]
      before_action :set_game, only: [:show, :update, :destroy]

      # GET /games
      def index
        @games = Game.all

        render json: @games
      end

      # GET /games/1
      def show
        render json: @game
      end

      # POST /games
      def create
        @game = current_game_developer.games.build(game_params)

        if @game.save
          render json: @game, status: :created, location: @game
        else
          render json: @game.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /games/1
      def update
        if @game.update(game_params)
          render json: @game
        else
          render json: @game.errors, status: :unprocessable_entity
        end
      end

      # DELETE /games/1
      def destroy
        @game.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_game
          @game = current_game_developer.games.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def game_params
          params.require(:game).permit(:title, :game_developer_id, :category, :tags, :description, :gameType, :width, :height, :file, :cover)
        end
    end
  end
end
