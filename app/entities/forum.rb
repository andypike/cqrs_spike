class Forum < Entity
  attr_reader :name

  def create(params)
    fire :create_forum, :name => params[:name], :id => UUID.new.generate
  end

  def update(params)
    fire :update_forum, :name => params[:name]
  end

  def on_create_forum(event)
    @name = event.data[:name]
    @id = event.data[:id]
  end

  def on_update_forum(event)
    @name = event.data[:name]
  end
end