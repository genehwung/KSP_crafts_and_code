// Karman line flight for sounding rocket.
// Three stages launch, two stages seperations and parachute arm.
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
wait until verticalspeed < 125.
stage.
// Wait until the dynamic Q is small enough to stage.
wait until availablethrust < 1.
wait until verticalspeed < 260.
// Use the decouper as a ulage.
stage.
wait 0.6.
print "Seperation.".
stage.

// Seperate the payload, arm parachute.
wait until altitude > 95e3.
stage.
ag9 on.

// Separate the top hat for parachute.
wait until altitude < 25e3.
stage.

wait 10.