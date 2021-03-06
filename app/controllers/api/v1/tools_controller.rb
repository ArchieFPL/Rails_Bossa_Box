# frozen_string_literal: true

module Api
  module V1
    # CRUD Tools
    class ToolsController < ApplicationController
      before_action :set_tool, only: %i[show update destroy]

      # GET /tools
      def index
        # get paginated current user tools
        @tools = current_user.tools.paginate(page: params[:page], per_page:20)
        json_response(@tools)
      end

      # POST /tools
      def create
        # create tools belonnging to current user
        @tool = current_user.tools.create!(tool_params)
        json_response(@tool, :created)
      end

      # GET /tools/:id
      def show
        json_response(@tool)
      end

      # GET /tools/tags/:tags
      def tags
        @tool = Tool.tagged(params[:tags])
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
        params.permit(:title, :link, :description, tags: [])
      end

      def set_tool
        @tool = Tool.find(params[:id])
      end
    end
  end
end
