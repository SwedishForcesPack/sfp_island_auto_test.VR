_null = [] spawn {
  _gridSize = 500;
  _cameraHeight = 100;

  _cam = "camera" camCreate (position player); 
  _cam cameraEffect ["Internal", "Top"];
  _x = 0;
  while {_x < worldSize} do {
    _y = 0;
    while {_y < worldSize} do  {
      _camTarget = [_x, _y, 0];
      _camPos = [_x + _gridSize, _y + _gridSize, _cameraHeight];
      _cam camSetPos _camPos; 
      _cam camSetDir (_camPos vectorFromTo _camTarget);
      _cam camCommit 0;
      sleep 0.2;
      _y = _y + _gridSize;
    };
    _x = _x + _gridSize;
  };

  _cam cameraEffect ["Terminate", "Top"];
  camDestroy _cam;

  endMission "END1";
};
