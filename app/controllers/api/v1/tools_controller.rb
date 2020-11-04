# frozen_string_literal: true

module Api
  module V1
    # CRUD Tools
    class ToolsController < ApplicationController
      before_action :set_tool, only: %i[show update destroy]

      # GET /tools
      def index
        @tools = Tool.all
        json_response(@tools)
      end

      # POST /tools
      def create
        @tool = Tool.create!(tool_params)
        json_response(@tool, :created)
      end

      # GET /tools/:id
      def show
        json_response(@tool)
      end

      # PUT /tools/:id
      def update
        @tool.update(tool_params)
        head :no_content
      end

      #  DELETE /tools/:id
      def destroy
        @tool.destroy
        head :no_content
      end

      private

      def tool_params
        # whitelist params
        params.permit(:title, :link, :description, :created_by, tags: [])
      end

      def set_tool
        @tool = Tool.find(params[:id])
      end
    end
  end
end
