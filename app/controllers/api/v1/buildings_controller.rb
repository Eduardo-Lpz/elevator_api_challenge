# frozen_string_literal: true

module Api
  module V1
    class BuildingsController < ApplicationController
      before_action :set_building, only: %i[show update destroy]

      def index
        @buildings = Building.all

        render json: @buildings
      end

      def show
        render json: @building
      end

      def create
        @building = Building.new(building_params)

        if @building.save
          render json: @building, status: :created, location: @building
        else
          render json: @building.errors, status: :unprocessable_entity
        end
      end

      def update
        if @building.update(building_params)
          render json: @building
        else
          render json: @building.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @building.destroy
      end

      private

      def set_building
        @building = Building.find(params[:id])
      end

      def building_params
        params.require(:building).permit(:floors, :street, :city, :country)
      end
    end
  end
end
