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

  def find_artist_by_id(artist_1)
    @artists.find do |artist|
      artist.id
    end
  end

  def artists_with_multiple_photographs(artist)
    @photographs.find do |photograph|
      photograph.artist_id("3")
    end
  end
end
