

$PI = 3.14


def f(x)
  return 1*0.1/((x+1)*Math.sqrt(x**2+1))
end

def f2(x)
  return Math.tan(((x/2)+($PI/4)))**3
end

def prm(a,b,n)

  $s=(f(a)+f(b))/2
  $h=(b-a)/n
  $i = 1

  while $i<n
    $s+=f(a+$i*$h)
    $i+=1
  end

  $I=$h*$s
  return $I
end

def prmForF2(a,b,n)

  $s=(f2(a)+f2(b))/2
  $h=(b-a)/n
  $i = 1

  while $i<n
    $s+=f2(a+$i*$h)
    $i+=1
  end

  $I=$h*$s
  return $I
end

def trp(a,b,n)
  $width = (b-a)/n;

  $trapezoidal_integral = 0.0
  $step = 0
  while $step < n
    $x1 = a + $step*$width
    $x2 = a + ($step+1)*$width
    $trapezoidal_integral += 0.5*($x2-$x1)*(f($x1) + f($x2))
    $step+=1
  end

  return $trapezoidal_integral

end




def trpForF2(a,b,n)
  $width = (b-a)/n;

  $trapezoidal_integral = 0.0
  $step = 0
  while $step < n
    $x1 = a + $step*$width
    $x2 = a + ($step+1)*$width
    $trapezoidal_integral += 0.5*($x2-$x1)*(f2($x1) + f2($x2))
    $step+=1
  end

  return $trapezoidal_integral

end


def main
  $a = 0.3
  $b = 0.3

  $a2 = 0.0
  $b2 = $PI/4


  puts  prm($a,$b,10)

  puts  trp($a,$b,10)

  puts  prmForF2($a2,$b2,10)

  puts  trpForF2($a2,$b2,10)
end

def fact(n)
  (1..n).reduce(:*) || 1
end

def f3(i,x)
  i = 0
  return Math.log(3)**i/(fact(i))*x**i
end

def taskTwo
  e = 0.00001.to_f
  an = 0.00000.to_f
  res = 0
  n = 10
  x = 0.1
  while an < e
    while n < 58
      an = f3(n,x)
      res+= an
      n+=1
      x+=0.1
    end
  end
  puts res
end


main

puts "Task two : "
taskTwo