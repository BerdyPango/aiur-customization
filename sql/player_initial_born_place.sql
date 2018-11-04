# Aliance born place to stormwind
# update playercreateinfo set map = 0, zone = 1519, position_x = -9034.009766, position_y = 458.59021, position_z = 93.055931, orientation = 0.643273 where race in (1, 3, 4, 7, 11) and class != 6;

# Horde born place to Orgrim
# update playercreateinfo set map = 1, zone = 1637, position_x = 1485.37439, position_y = -4415.277344, position_z = 24.336905, orientation = 0.062777 where race in (2, 5, 6, 8, 10) and class != 6;

# all except dk to 达拉然
update playercreateinfo set map = 571, zone = 4395, position_x = 5818.451172, position_y = 628.820801, position_z = 647.392395, orientation = 2.516417 where race in (1, 2, 3, 4, 5, 6, 7, 8, 10, 11) and class != 6;