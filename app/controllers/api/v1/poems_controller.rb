module Api
  module V1
    class PoemsController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :doorkeeper_authorize!
      before_action :check_ownership, only: [:show, :update, :destroy]
      respond_to :json
      
      def index
        respond_with current_resource_owner.poems
      end
     
      def show
        respond_with current_resource_owner.poems.find(param_id)
      end
      
      def create
        respond_with current_resource_owner.poems.create(poem_params)
      end
      
      def update
        respond_with Poem.find(param_id).update(poem_params)
      end
      
      def destroy
        respond_with Poem.destroy(param_id)
      end
      
      private 
      
      def poem_params
        params.require(:poem).permit(:title, :content, :author)
      end

      def param_id
        params[:id] || poem_params[:id]
      end

      def check_ownership
        if param_id and Poem.find(param_id).user != current_resource_owner
          render json: {}, status: 401
        end
      end

      def current_resource_owner
        User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
      end
    end
  end
end