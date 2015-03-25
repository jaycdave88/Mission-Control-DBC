class HelpsController < ApplicationController

  def new
  end

  def show
    @help = Help.find(params[:id])
    render partial: 'show'
  end

  def create
    @sticky = Sticky.find(params[:sticky_id])
    help = @sticky.helps.new(help_params)
    help.user_id =session[:user_id]
    help.save
    redirect_to stickies_path
  end

  def edit
    @help = Help.find(params[:id])
  end

  def update
    @help = Help.find(params[:id])
    @help.update(help_params)
    redirect_to @help.sticky
  end

  def destroy
    @help = Help.find(params[:id])
    @help.destroy
    redirect_to stickies_path
  end

  def recent
    user = User.find(params[:user_id])
    stickies = user.stickies
    helps = []
    stickies.each do |sticky|
      helps += sticky.helps.where("created_at >= :date OR updated_at >= :date", date: params[:date])
    end

    render json: helps
  end

  private

  def help_params
    params.require(:help).permit(:title, :content)
  end
end
