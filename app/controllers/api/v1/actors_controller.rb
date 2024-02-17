# frozen_string_literal: true

module Api
  module V1
    class ActorsController < ApplicationController
      def show
        @actor = Actor.includes(:movies).find_by(id: params[:id])

        if @actor
          render json: @actor, Serializer: ActorSerializer, status: :ok
        else
          render json: { error: "Actor with id: #{params[:id]} not found" }, status: :not_found
        end
      end

      def index
        @actor = Actor.includes(:movies)
                      .search_by_name(params[:search])

        render json: @actor, Serializer: ActorSerializer, each_serializer: ActorSerializer, status: :ok
      end
    end
  end
end
