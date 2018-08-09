class ApplicationRecord < ActiveRecord::Base
  extend Helpers
  self.abstract_class = true
  before_save :create_slug

  def self.find_by_slug(slug)
    find_by(slug: slug)
  end

  private

  def create_slug
    self.slug = name.downcase.gsub(/\s+/, '-').gsub(/[^A-Za-z\-0-9]/, '')
  end
end