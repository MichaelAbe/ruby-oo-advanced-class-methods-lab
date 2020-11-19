class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(names)
    Song.all.find{|song| song.name == names}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name) 
  end

  def self.alphabetical
    @@all.sort_by{|a| a.name}
  end

  def self.new_from_filename(filename)
    song = Song.new
    artist_name = name
    array = filename.split(/[-.]/)
    song.artist_name = array[0].strip
    r = array[1].strip
    song.name = r
    song
  end

  def self.create_from_filename(filename)
    song = Song.new
    artist_name = name
    song.save
    array = filename.split(/[-.]/)
    song.artist_name = array[0].strip
    r = array[1].strip
    song.name = r
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
