module ArtistHelper
  def deslugify(slug)
    slug.split('-').map(&:capitalize).join(' ')
  end
end