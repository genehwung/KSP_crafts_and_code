// Karman Line.
run util.
run globals_util.

clearscreen.

// Wait until user set the throttle to 1 to avoid 2nd stage failure.
wait until throttle > 0.99.

// Launch Tiny Tim booster.
lock throttle to 1.
stage.

// Wait until the dynamic Q is small enough to stage.
wait until availablethrust < 1.
wait until verticalspeed < 150.
// Use the decouper as a ulage.
stage.
wait 1.
print "Seperation.".
stage.

// Seperate the payload, arm parachute.
wait until verticalspeed < 0.
stage.
ag9 on.

wait 10.