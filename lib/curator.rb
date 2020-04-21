class Curator

  attr_reader :photographs, :artists

  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photograph)
    @photographs << photograph
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    @artists.find do |artist|
    artist.id == id
    end
  end

  def photographs_by_artist
    @photographs.reduce({}) do |artist_by_photos, photograph|
      artist = find_artist_by_id(photograph.artist_id)
      artist_by_photos[artist] = [] if artist_by_photos[artist].nil?

      artist_by_photos[artist] << photograph
      artist_by_photos
    end
  end

  def artists_with_multiple_photographs
    photographs_by_artist.map do |artist, photographs|
      artist.name if photographs.length > 1
    end.compact
  end
end
