class Plant
  include MongoMapper::Document

  key :name,         String
  key :planted_at,   Date
  key :harvest_time, Integer
  key :harvest_at,   Date
  timestamps!

  belongs_to :user

  after_save :set_harvest_at

  scope :harvested, :harvest_at.lt => Time.zone.now
  scope :growing, :harvest_at.gte => Time.zone.now
  
  def planted_at=(date)
    self[:planted_at] = date.is_a?(String) ? Time.zone.parse(date) : date
  end

private
  def set_harvest_at
    update_attribute :harvest_at, planted_at + harvest_time.days if self.harvest_at.blank?
  end  
end
