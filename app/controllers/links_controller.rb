class LinksController < ApplicationController
  before_action :authorized
  before_action :set_link, only: [:show, :update, :destroy]

  def index
    @links = Link.where(user: @user)
    render json: @links
  end

  def show
    if @link.user_id == @user.id
      render json: @link
    else
      render json: {message: "Unautorized"}, status: :unauthorized
    end
  end

  def create
    @link = Link.new(link_params)
    @link.user = @user
    @link.short = @link.get_code
    if @link.save
      render json: @link, status: :created, location: @link
    else
      render json: @link.errors, status: :unprocessable_entity
    end
  end

  def update
    if @link.update(link_params)
      render json: @link
    else
      render json: @link.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @link.destroy
  end

  private
    def set_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:full)
    end
end
