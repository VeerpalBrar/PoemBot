class PoemsController < ApplicationController
  before_action :set_poem, only: [:show, :edit, :update, :destroy]
  before_action :check_ownership, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :upvote_count, :search]
  
  # GET /poems
  # GET /poems.json
  def index
    @poems = Poem.order("created_at DESC").page(1)
  end

  # GET /poems/1
  # GET /poems/1.json
  def show
  end

  # GET /poems/new
  def new
    @poem = current_user.poems.build()
  end

  # GET /poems/1/edit
  def edit
  end

  # POST /poems
  # POST /poems.json
  def create
    @poem = current_user.poems.build(poem_params)

    if @poem.save
      render json: @poem
    else
      render json: @poem.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /poems/1
  # PATCH/PUT /poems/1.json
  def update
    respond_to do |format|
      if @poem.update(poem_params)
        format.html { redirect_to @poem, notice: 'Poem was successfully updated.' }
        format.json { render :show, status: :ok, location: @poem }
      else
        format.html { render :edit }
        format.json { render json: @poem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poems/1
  # DELETE /poems/1.json
  def destroy
    @poem.destroy
    respond_to do |format|
      format.html { redirect_to poems_url, notice: 'Poem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def upvote
    @poem = Poem.find_by(id: params[:id])

    vote = current_user.has_voted_for?(@poem.id) ? current_user.find_vote_for(@poem.id) : current_user.vote_for(@poem.id) 
    if vote
      render json: @poem
    else
      render json: @poem.errors, status: :unprocessable_entity
    end
  end
  
  def upvote_count
    @poem = Poem.find_by(id: params[:id])
    vote_count = @poem&.votes&.count
    if vote_count
      render json: {count: vote_count, by_current_user: current_user&.has_voted_for?(@poem.id)|| false}
    else
      render json: {error: "poem not found"}
    end
  end

  def search
    page = params[:page] || 1
    query = params[:query] || ''

    poems = Poem.search(query).order("created_at DESC").page(params[:page])
    render json: poems
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poem
      @poem = Poem.find(params[:id])
    end

    def check_ownership
      if @poem.user != current_user
        render json: {}, status: 401
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poem_params
      params.require(:poem).permit(:author, :title, :content)
    end
end
