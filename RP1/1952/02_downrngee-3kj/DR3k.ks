// Down range 3KMe
run util.
run globals_util.

clearscreen.

// Wait until user set the throttle to 1 to avoid 2nd stage failure.
wait until throttle > 0.99.

// Setup the steering and throttle before launch.
lock throttle to 1.
// Launch upward.
sas on.
set launch_heading to 87. // 270. // 40. //
set heading_tgt to launch_heading.
set pitch_tgt to 90.

// Launch wait until the thrust is up.
stage.
wait until availablethrust > 100.
wait 2.45.
set launch_time to time.
stage.
// proper steering.
wait until verticalspeed > 0.
sas off.
lock steering to heading(heading_tgt, pitch_tgt, roll_tgt).

// Kick
wait until verticalspeed > 15.
set pitch_tgt to 83.
wait 5.

// Follow surface prograde
lock srf to get_heading_pitch(srfprograde:vector).
lock pitch_tgt to srf[1].

// Upperstage spin stablizaion.
wait until time:seconds-launch_time:seconds > 88.1.

unlock steering.
SET controlStick to SHIP:CONTROL.
SET controlStick:ROLL to 1.0.

// Hot start 2nd stage.
wait until time:seconds-launch_time:seconds > 93.
stage.
// Seperation.
wait until time:seconds-launch_time:seconds > 93.6.
stage.

// stage.
// wait 2.
// SET controlStick:ROLL to 0.0.
// Hot staging.
// stage.

// Seperation.
// wait 1.
// stage.
