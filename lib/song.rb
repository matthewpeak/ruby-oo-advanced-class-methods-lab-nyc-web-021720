class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  

  def self.create
    song = Song.new
    song.save
    song
  end

 def self.new_by_name(new_name)
    song      = self.create
    song.name = new_name
    song
 end

 def self.create_by_name(new_name)
     song = self.new_by_name(new_name)
     song
 end
 
  def self.find_by_name(search_name)
    @@all.select{|elem| search_name == elem.name}[0]
  end
 

 def self.find_or_create_by_name(song_name)
  #  if find_by_name(song_name) == song_name
  #    return create_by_name(song_name)  
  #   else 
  #    return find_by_name(song_name)
  #   end 
    self.find_by_name(song_name) || self.create_by_name(song_name)

  end

  def self.alphabetical 
   @@all.sort_by{|song| song.name}
  end 

  def self.new_from_filename(song_name)
   cleaned = song_name.split("-").map{|elem| elem.strip.split(".")[0]}
   song= Song.new 
   song.name = cleaned[1]
   song.artist_name= cleaned[0]
   song.save 
   song 
  end
  
  def self.create_from_filename(song_name)
     self.new_from_filename(song_name)
  end
  def self.destroy_all
    @@all = []
  end 
end




