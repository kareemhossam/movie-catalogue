# frozen_string_literal: true

module Api
  module V1
    class MoviesController < ApplicationController
      def show
        @movie = Movie.includes(:actors)
                      .where(id: params[:id])
                      .with_avg_score
                      .limit(1).first

        if @movie
          render json: @movie, Serializer: MovieSerializer, status: :ok
        else
          render json: { error: "Movie with id: #{params[:id]} not found" }, status: :not_found
        end
      end

      def index
        @movies = Movie.includes(:actors)
                       .with_avg_score
                       .order_by_avg_score(params[:direction])

        render json: @movies, Serializer: MovieSerializer, each_serializer: MovieSerializer, status: :ok
      end
    end
  end
end
