class Url < ActiveRecord::Base
  # validates_uniqueness_of :url
  # validates_format_of :url, :with => URI::regexp(%w(http https))
  # before_save 
  before_save :generate_short_url
  def generate_short_url 
    self.short_url = (0...5).map{ ('a'..'z').to_a[rand(26)] }.join 
  end
  # do some shit# Remember to create a migration!
end
