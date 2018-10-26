require('minitest/autorun')
require('minitest/rg')
require_relative('../song')

class SongTest < MiniTest::Test

  def setup()
    @song1 = Song.new("Don't stop believin'", "Journey")
    @song2 = Song.new("Don't stop me now", "Queen")
  end

  def test_song_has_name
    assert_equal("Don't stop me now", @song2.name_of_song)
  end

  def test_song_has_artist
    assert_equal("Journey", @song1.artist)
  end


end
