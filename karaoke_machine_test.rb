require 'minitest/autorun'
require './karaoke_machine'

class KaraokeMachineTest < Minitest::Test
  def test_nothing_melody
    melody = ''
    answer = melody
    assert_equal answer, KaraokeMachine.new(melody).transpose(0)
  end

  def test_no_transpose
    melody = 'C D E F |E D C   |E F G A |G F E   |C   C   |C   C   |CCDDEEFF|E D C   '
    answer = melody
    assert_equal answer, KaraokeMachine.new(melody).transpose(0)
  end

  def test_transpose_key_up_by_2steps
    melody = 'C D E F |E D C   |E F G A |G F E   |C   C   |C   C   |CCDDEEFF|E D C   '
    answer = 'D E F# G |F# E D   |F# G A B |A G F#   |D   D   |D   D   |DDEEF#F#GG|F# E D   '
    assert_equal answer, KaraokeMachine.new(melody).transpose(2)
  end

  def test_transpose_key_up_by_7steps
    melody = 'C D E F |E D C   |E F G A |G F E   |C   C   |C   C   |CCDDEEFF|E D C   '
    answer = 'G A B C |B A G   |B C D E |D C B   |G   G   |G   G   |GGAABBCC|B A G   '
    assert_equal answer, KaraokeMachine.new(melody).transpose(7)
  end

  def test_transpose_key_down_by_step
    melody = 'C D E F |E D C   |E F G A |G F E   |C   C   |C   C   |CCDDEEFF|E D C   '
    answer = 'B C# D# E |D# C# B   |D# E F# G# |F# E D#   |B   B   |B   B   |BBC#C#D#D#EE|D# C# B   '
    assert_equal answer, KaraokeMachine.new(melody).transpose(-1)
  end

  def test_transpose_key_down_by_7steps
    melody = 'C D E F |E D C   |E F G A |G F E   |C   C   |C   C   |CCDDEEFF|E D C   '
    answer = 'F G A A# |A G F   |A A# C D |C A# A   |F   F   |F   F   |FFGGAAA#A#|A G F   '
    assert_equal answer, KaraokeMachine.new(melody).transpose(-7)
  end

  def test_transpose_key_up_by_1octave
    melody = 'C D E F |E D C   |E F G A |G F E   |C   C   |C   C   |CCDDEEFF|E D C   '
    answer = melody
    assert_equal answer, KaraokeMachine.new(melody).transpose(12)
  end

  def test_transpose_key_down_by_1octave
    melody = 'C D E F |E D C   |E F G A |G F E   |C   C   |C   C   |CCDDEEFF|E D C   '
    answer = melody
    assert_equal answer, KaraokeMachine.new(melody).transpose(-12)
  end

  def test_transpose_key_up_by_14steps
    melody = 'C D E F |E D C   |E F G A |G F E   |C   C   |C   C   |CCDDEEFF|E D C   '
    answer = 'D E F# G |F# E D   |F# G A B |A G F#   |D   D   |D   D   |DDEEF#F#GG|F# E D   '
    assert_equal answer, KaraokeMachine.new(melody).transpose(14)
  end

  def test_transpose_key_down_by_13steps
    melody = 'C D E F |E D C   |E F G A |G F E   |C   C   |C   C   |CCDDEEFF|E D C   '
    answer = 'B C# D# E |D# C# B   |D# E F# G# |F# E D#   |B   B   |B   B   |BBC#C#D#D#EE|D# C# B   '
    assert_equal answer, KaraokeMachine.new(melody).transpose(-13)
  end

  def test_transpose_key_up_by_2octaves
    melody = 'C D E F |E D C   |E F G A |G F E   |C   C   |C   C   |CCDDEEFF|E D C   '
    answer = melody
    assert_equal answer, KaraokeMachine.new(melody).transpose(24)
  end

  def test_transpose_key_down_by_2octaves
    melody = 'C D E F |E D C   |E F G A |G F E   |C   C   |C   C   |CCDDEEFF|E D C   '
    answer = melody
    assert_equal answer, KaraokeMachine.new(melody).transpose(-24)
  end

  def test_transpose_key_up_by_26steps
    melody = 'C D E F |E D C   |E F G A |G F E   |C   C   |C   C   |CCDDEEFF|E D C   '
    answer = 'D E F# G |F# E D   |F# G A B |A G F#   |D   D   |D   D   |DDEEF#F#GG|F# E D   '
    assert_equal answer, KaraokeMachine.new(melody).transpose(26)
  end

  def test_transpose_key_down_by_25steps
    melody = 'C D E F |E D C   |E F G A |G F E   |C   C   |C   C   |CCDDEEFF|E D C   '
    answer = 'B C# D# E |D# C# B   |D# E F# G# |F# E D#   |B   B   |B   B   |BBC#C#D#D#EE|D# C# B   '
    assert_equal answer, KaraokeMachine.new(melody).transpose(-25)
  end

  def test_transpose_key_up_by_6steps_for_fis
    melody = 'F# G# A# B |A# G# F#   |A# B C# D# |C# B A#   |F#   F#   |F#   F#   |F#F#G#G#A#A#BB|A# G# F#   '
    answer = 'C D E F |E D C   |E F G A |G F E   |C   C   |C   C   |CCDDEEFF|E D C   '
    assert_equal answer, KaraokeMachine.new(melody).transpose(6)
  end

  def test_transpose_key_down_by_6steps_for_fis
    melody = 'F# G# A# B |A# G# F#   |A# B C# D# |C# B A#   |F#   F#   |F#   F#   |F#F#G#G#A#A#BB|A# G# F#   '
    answer = 'C D E F |E D C   |E F G A |G F E   |C   C   |C   C   |CCDDEEFF|E D C   '
    assert_equal answer, KaraokeMachine.new(melody).transpose(-6)
  end

  def test_continuously_transpose
    melody = 'C D E F |E D C   |E F G A |G F E   |C   C   |C   C   |CCDDEEFF|E D C   '
    karaoke = KaraokeMachine.new(melody)

    answer = melody
    assert_equal answer, karaoke.transpose(0)

    answer = 'D E F# G |F# E D   |F# G A B |A G F#   |D   D   |D   D   |DDEEF#F#GG|F# E D   '
    assert_equal answer, karaoke.transpose(2)

    answer = 'B C# D# E |D# C# B   |D# E F# G# |F# E D#   |B   B   |B   B   |BBC#C#D#D#EE|D# C# B   '
    assert_equal answer, karaoke.transpose(-1)
  end
end
