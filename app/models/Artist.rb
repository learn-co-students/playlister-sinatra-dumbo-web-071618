class Artist < ActiveRecord::Base
  extend ArtistHelper

  has_many :songs
  has_many :genres, through: :songs

  def slug
    name.downcase.gsub(/\s+/, '-')
  end

  def self.find_by_slug(slug)
    Artist.find_by_name(deslugify(slug))
  end
end