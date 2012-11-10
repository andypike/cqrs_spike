class ForumReport < ActiveRecord::Base
  extend Report

  attr_accessible :name, :entity_id

  def self.map_state(entity, report)
    report.name = entity.name
  end

  def to_param
    self.entity_id
  end
end