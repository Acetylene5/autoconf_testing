      subroutine junk
      include "Stuff.com"

      real*8 ones(4,4), twos(4,4)

      ones(1,1) = 1.0
      ones(1,2) = 0.0
      ones(1,3) = 0.0
      ones(1,4) = 0.0
      ones(2,1) = 0.0
      ones(2,2) = 1.0
      ones(2,3) = 0.0
      ones(2,4) = 0.0
      ones(3,1) = 0.0
      ones(3,2) = 0.0
      ones(3,3) = 1.0
      ones(3,4) = 0.0
      ones(4,1) = 0.0
      ones(4,2) = 0.0
      ones(4,3) = 0.0
      ones(4,4) = 1.0

      twos(1,1) = 0.0
      twos(1,2) = 0.0
      twos(1,3) = 0.0
      twos(1,4) = 0.0
      twos(2,1) = 0.0
      twos(2,2) = 0.0
      twos(2,3) = 0.0
      twos(2,4) = 0.0
      twos(3,1) = 0.0
      twos(3,2) = 0.0
      twos(3,3) = 0.0
      twos(3,4) = 0.0
      twos(4,1) = 0.0
      twos(4,2) = 0.0
      twos(4,3) = 0.0
      twos(4,4) = 0.0

      call dcopy(16, ones, 1, twos, 1)

      write (*,*) "This is another test"
      write (*,*) guess
      write (*,*) twos(1,1), twos(1,2), twos(2,2)
      call drawcurs

      end
