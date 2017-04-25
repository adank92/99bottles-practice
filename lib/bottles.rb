class Bottles
  NoMore = lambda do |verse|
    "No more bottles of beer on the wall, " +
    "no more bottles of beer.\n" +
    "Go to the store and buy some more, " +
    "99 bottles of beer on the wall.\n"
  end

  LastOne = lambda do |verse|
    "1 bottle of beer on the wall, " +
    "1 bottle of beer.\n" +
    "Take it down and pass it around, " +
    "no more bottles of beer on the wall.\n"
  end

  Penultimate = lambda do |verse|
    "2 bottles of beer on the wall, " +
    "2 bottles of beer.\n" +
    "Take one down and pass it around, " +
    "1 bottle of beer on the wall.\n"
  end

  Default = lambda do |verse|
    "#{verse.number} bottles of beer on the wall, " +
    "#{verse.number} bottles of beer.\n" +
    "Take one down and pass it around, " +
    "#{verse.number-1} bottles of beer on the wall.\n"
  end

  def song
    verses(99, 0)
  end

  def verses(hi, lo)
    hi.downto(lo).map { |n| verse(n) }.join("\n")
  end

  def verse(n)
    verse_for(n).text
  end

  def verse_for(n)
    case n
    when 0 then Verse.new(n, &NoMore)
    when 1 then Verse.new(n, &LastOne)
    when 2 then Verse.new(n, &Penultimate)
    else        Verse.new(n, &Default)
    end
  end
end

class Verse
  attr_reader :number, :lyrics

  def initialize(number, &lyrics)
    @number = number
    @lyrics = lyrics
  end

  def text
    @lyrics.call self
  end
end
