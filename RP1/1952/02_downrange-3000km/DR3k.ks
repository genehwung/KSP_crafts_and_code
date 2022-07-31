// Down range 3KMe
run util.
run globals_util.

clearscreen.
local initial_mass is ship:mass.
local spoil_up is 2.45.
local rush is 0.1.
local delay is 0.3. 
local first_stage is 93.9 + delay + rush.

// Wait until user set the throttle to 1 to avoid 2nd stage failure.
wait until throttle > 0.99.

// Setup the steering and throttle before launch.
lock throttle to 1.
// Launch upward.
sas on.
set launch_heading to 90. // 270. // 40. //
set heading_tgt to launch_heading.
set pitch_tgt to 90.

// Launch wait until the engine is up.
stage.
wait spoil_up-rush.
set launch_time to time.
wait until ship:mass < initial_mass-1e-5.
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
wait until time:seconds-launch_time:seconds > first_stage-5.

unlock steering.
SET controlStick to SHIP:CONTROL.
SET controlStick:ROLL to 1.0.

// Hot start 2nd stage.
wait until time:seconds-launch_time:seconds > first_stage-0.6.
stage.
// Seperation.
// not sure how, but there is delay for the engine to shutoff.
wait until time:seconds-launch_time:seconds > first_stage.
stage.

// stage.
// wait 2.
// SET controlStick:ROLL to 0.0.
// Hot staging.
// stage.

// Seperation.
// wait 1.
// stage.
