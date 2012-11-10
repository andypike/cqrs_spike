class Entity
  attr_reader :id

  def self.find(entity_id)
    events = Event.find(:entity_id => entity_id).sort{|x,y| x.fired_at <=> y.fired_at}
    self.build_from(events)
  end

  def self.build_from(events)
    entity = self.new
    events.each do |event|
      entity.send :apply, event
    end
    entity
  end

  private
    def fire(event_name, data)
      event = Event.new(:name => event_name, :data => data, :fired_at => DateTime.now.utc)
      apply event
      event.entity_id = @id
      event.save
      "#{self.class.name}Report".constantize.update_state(self)
      self
    end

    def apply(event)
      method("on_#{event.name}").call(event)
    end
end