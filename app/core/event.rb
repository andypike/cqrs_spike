class Event < Ohm::Model
  attribute :entity_id
  attribute :fired_at
  attribute :name
  attribute :serialized_data
  attribute :serialized_fired_at

  index :entity_id

  def data
    @data ||= deserialize_data
  end

  def data=(data_hash)
    @data = data_hash
    self.serialized_data = data_hash.to_yaml
  end

  def fired_at
    @fired_at ||= deserialize_fired_at
  end

  def fired_at=(fired_at_date)
    @fired_at = fired_at_date
    self.serialized_fired_at = fired_at_date.to_s
  end

  private 
    def deserialize_data
      YAML.load(self.serialized_data)
    end

    def deserialize_fired_at
      DateTime.parse(self.serialized_fired_at)
    end    
end