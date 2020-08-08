require './fixture/fixture.rb'

class SewingMachine < Fixture

  attr_reader :name
  
  def initialize name
    @name = name
  end
  
  def auto_action_fixture
    puts 'there is a sewing machine in the corner'
    puts 'it is flashing its light for various periods ... it appears to be some sort of coded message'
    puts ''
    h;e;l;l;o;space
    g;e;t;space
    a;space
    d;i;s;c;space
    f;r;o;m;space
    a;space
    s;a;f;e;space
    p;l;a;c;e;space
  end
  
  def space;puts '';end
  def a;dbg 'a';puts 'short long';end
  def b;dbg 'b';puts 'long short short short';end
  def c;dbg 'c';puts 'long short long short';end
  def d;dbg 'd';puts 'long short short';end
  def e;dbg 'e';puts 'short';end
  def f;dbg 'f';puts 'short short long short';end
  def g;dbg 'g';puts 'long long short';end
  def h;dbg 'h';puts 'short short short short';end
  def i;dbg 'i';puts 'short short';end
  def j;dbg 'j';puts 'short long long long';end
  def k;dbg 'k';puts 'long short long';end
  def l;dbg 'l';puts 'short long short short';end
  def m;dbg 'm';puts 'long long';end
  def n;dbg 'n';puts 'long short';end
  def o;dbg 'o';puts 'long long long';end
  def p;dbg 'p';puts 'short long long short';end
  def q;dbg 'q';puts 'long long short long';end
  def r;dbg 'r';puts 'short long short';end
  def s;dbg 's';puts 'short short short';end
  def t;dbg 't';puts 'long';end
  def u;dbg 'u';puts 'short short long';end
  def v;dbg 'v';puts 'short short short long';end
  def w;dbg 'w';puts 'short long long';end
  def x;dbg 'x';puts 'long short short long';end
  def y;dbg 'y';puts 'long short long long';end
  def z;dbg 'z';puts 'long long short short';end
  
end