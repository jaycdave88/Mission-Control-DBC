class StickiesController < ApplicationController

  def new
    @sticky = Sticky.new
  end

  def index
    if params[:query]

      @stickies =
      Sticky.limit(20)
      .where(
        "lower(title) LIKE :bob", bob: "%#{params[:query].downcase}%"
      )

    else
      puts 'yo'
      @stickies = Sticky.limit(20).order(updated_at: :desc).includes(:user)
    end

  end

  def create
    @sticky = Sticky.new(sticky_params)
    @sticky.user_id = session[:user_id]
    @sticky.save
    redirect_to stickies_path
  end

  def show
    set_sticky
    @helps = @sticky.helps
    render partial: 'show'
  end

  def edit
    set_sticky
  end

  def update
    set_sticky.update(sticky_params)
    redirect_to stickies_path
  end

  def destroy
    set_sticky.destroy
    redirect_to stickies_path
  end

  private
  def set_sticky
    @sticky = Sticky.find(params[:id])
  end

  def sticky_params
    params.require(:sticky).permit(:title, :content, :image)
  end

end
