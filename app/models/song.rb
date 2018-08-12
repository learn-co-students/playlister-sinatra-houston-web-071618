class Song <ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres

  def slug
    name=self.name.downcase
    name.gsub!(" ","-")
  end

  def self.find_by_slug(slug)
    Song.all.find do |song|
      song.slug == slug
    end
  end

  def artist_name=(artist_name)
    #create artist
    #make assosciation
    desired_artist = Artist.find_or_create_by(name: artist_name)
    self.update(artist: desired_artist)

  end

  def genre_array=(genre_array)
    #create genre
    #make assosciation
    self.update(genre_ids:genre_array)

  end
end
