FUNCTION NOTIFY {
  PARAMETER message.
  HUDTEXT("kOS: " + message, 5, 2, 50, WHITE, false).
}

FUNCTION PITCH {
  PARAMETER triggerAltitude.
  PARAMETER pitchAngle.

  wait until ALTITUDE > triggerAltitude.
    lock steering to HEADING(90, pitchAngle).

  NOTIFY("STEERING locked to 90," + pitchAngle).
}

NOTIFY("Launch sequence initiated.").
wait 1.
sas off.

from { local x is 10.} until x = 0 step { set x to x-1.} do {
  NOTIFY("T-" + x).
  wait 1.
}

lock STEERING to HEADING(90,90).
NOTIFY("STEERING locked to 90,90").

stage.
wait until VERTICALSPEED > 100.

PITCH(1000, 85).
PITCH(2500, 75).
PITCH(5000, 70).
PITCH(6000, 68).
PITCH(7000, 66).
PITCH(8000, 64).
PITCH(9000, 62).
PITCH(10000, 60).
