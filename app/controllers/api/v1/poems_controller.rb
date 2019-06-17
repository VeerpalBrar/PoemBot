module Api
  module V1
    class PoemsController < ApplicationController
      skip_before_action :verify_authenticity_token
      
      respond_to :json
      
      def index
        respond_with Poem.all
      end
     
      def show
        respond_with Poem.find(params[:id])
      end
      
      def create
        byebug
        respond_with Poem.create(poem_params)
      end
      
      def update
        respond_with Poem.update(params[:id], params[:poems])
      end
      
      def destroy
        respond_with Poem.destroy(params[:id])
      end
      
      private 
      
      def poem_params
        params.require(:poem).permit(:title, :content, :author)
      end
    end
  end
end