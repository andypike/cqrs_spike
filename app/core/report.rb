module Report 
  def update_state(entity)
    report = self.where(:entity_id => entity.id).first_or_create
    self.map_state(entity, report)
    report.entity_id = entity.id
    report.save!
  end
end
