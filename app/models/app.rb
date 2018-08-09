class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  extend Helpers
  
  def slug
    name.downcase.gsub(/\s+/, '-')
  end

  def self.find_by_slug(slug)
    find_by_name(deslugify(slug))
  end
end