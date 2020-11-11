require_relative './fixture.rb'

class SewingMachine < Fixture

  attr_reader :name
  
  def initialize name
    @name = name
  end
  
  def auto_action_fixture  
    return "
	    There is a sewing machine in the corner. It is flashing its light for various periods ... it appears to be some sort of coded message
        #{h}#{e}#{l}#{l}#{o}#{space}
        #{g}#{e}#{t}#{space}
        #{a}#{space}
        #{d}#{i}#{s}#{c}#{space}
        #{f}#{r}#{o}#{m}#{space}
        #{a}#{space}
        #{s}#{a}#{f}#{e}#{space}
        #{p}#{l}#{a}#{c}#{e}#{space}
		"
  end
  
  def space;return '';end
  def a;dbg 'a';return 'short long';end
  def b;dbg 'b';return 'long short short short';end
  def c;dbg 'c';return 'long short long short';end
  def d;dbg 'd';return 'long short short';end
  def e;dbg 'e';return 'short';end
  def f;dbg 'f';return 'short short long short';end
  def g;dbg 'g';return 'long long short';end
  def h;dbg 'h';return 'short short short short';end
  def i;dbg 'i';return 'short short';end
  def j;dbg 'j';return 'short long long long';end
  def k;dbg 'k';return 'long short long';end
  def l;dbg 'l';return 'short long short short';end
  def m;dbg 'm';return 'long long';end
  def n;dbg 'n';return 'long short';end
  def o;dbg 'o';return 'long long long';end
  def p;dbg 'p';return 'short long long short';end
  def q;dbg 'q';return 'long long short long';end
  def r;dbg 'r';return 'short long short';end
  def s;dbg 's';return 'short short short';end
  def t;dbg 't';return 'long';end
  def u;dbg 'u';return 'short short long';end
  def v;dbg 'v';return 'short short short long';end
  def w;dbg 'w';return 'short long long';end
  def x;dbg 'x';return 'long short short long';end
  def y;dbg 'y';return 'long short long long';end
  def z;dbg 'z';return 'long long short short';end
  
end