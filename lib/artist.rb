class Artist

attr_accessor :name, :songs
extend Concerns::Findable
@@all = []
  def initialize name
    @name = name
    @songs = []
  end

def self.all
  @@all
end

def self.destroy_all
  all.clear
end

def save
  Artist.all << self
end

def self.create(name)
   new(name).tap {|artist| artist.save}
 end

 def add_song(song)
   @songs << song if !songs.include?(song)
   song.artist = self if song.artist == ""
   song
 end

 def genres
   songs.collect {|song|  song.genre}.uniq
 end
end
