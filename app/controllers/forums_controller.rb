class ForumsController < ApplicationController
  def index
    @forums = ForumReport.all
    @events = Event.all
  end

  def new

  end

  def create
    Forum.new.create(params[:forum])
    redirect_to forums_path, :notice => "Forum Created!"
  end

  def edit
    @forum = ForumReport.find_by_entity_id(params[:id])
  end

  def update
    Forum.find(params[:id]).update(params[:forum_report])
    redirect_to forums_path, :notice => "Forum Updated!"
  end
end