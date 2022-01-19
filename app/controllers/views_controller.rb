class ViewsController < ApplicationController
  before_action :authorized, except: [:catch_link]
  before_action :set_view, only: [:show, :update, :destroy]

  def index
    @links = Link.where(user: @user)
    @views = []
    @links.each { |link| @views += View.where(link_id: link.id) } if @links
    render json: @views
  end

  def show
    render json: @view
  end

  def create
    @view = View.new(view_params)

    if @view.save
      render json: @view, status: :created, location: @view
    else
      render json: @view.errors, status: :unprocessable_entity
    end
  end

  def update
    if @view.update(view_params)
      render json: @view
    else
      render json: @view.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @view.destroy
  end

  #cath short link
  def catch_link
    @link = Link.find_by(short: params[:short])
    user_agent = request.env["USER_AGENT"]
    user_agent = request.user_agent
    browser = user_agent.include? "Chrome"
    if @link.present?
      ip_address = request.ip
      operative_system = user_agent
      browser = user_agent
      @view = View.new
      @view.ip_address = ip_address
      @view.operative_system = get_operative_system(user_agent)
      @view.browser = get_browser(user_agent)
      @view.link_id = @link.id
      @view.save
      redirect_to @link.full
    else
      redirect_to root_path
    end
  end
  

  private
    def set_view
      @view = View.find(params[:id])
    end

    def view_params
      params.require(:view).permit(:ip_address, :operative_system, :browser)
    end

    def get_browser(user_agent_str)
     if user_agent_str.include? "Chrome"
       return "Chrome"
     elsif user_agent_str.include? "Safari"
       return "Safari"
     elsif user_agent_str.include? "Mozilla"
      return "Mozilla"
     else
      return "Undefined"
     end
    end

    def get_operative_system(user_agent_str)
     if user_agent_str.include? "Macintosh"
       return "Macintosh"
     elsif user_agent_str.include? "Windows"
       return "Windows"
     else
      return "Undefined"
     end
    end
end
