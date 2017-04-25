class Bottles
  def verse(initial)
    return zero_verse if initial == 0
    left = initial - 1
    <<-VERSE
#{bottles_string(initial)} of beer on the wall, #{bottles_string(initial)} of beer.
Take #{down_string(left)} down and pass it around, #{bottles_string(left)} of beer on the wall.
VERSE
  end

  def verses(from, to)
    range = to..from
    range.to_a.reverse.map { |initial| verse(initial) }.join("\n")
  end

  def song
    verses 99, 0
  end

  private

  def zero_verse
    <<-VERSE
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
VERSE
  end

  def bottles_string(amount)
    return 'no more bottles' if amount == 0
    string = "#{amount} bottle"
    string += 's' if amount > 1
    string
  end

  def down_string(amount)
    return 'it' if amount == 0
    "one"
  end
end
