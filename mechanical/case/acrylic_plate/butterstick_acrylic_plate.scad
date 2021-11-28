hole_diameter = 3.2;

porta_left_hole_x = 112.5;
porta_left_hole_y = 88.7;

porta_right_hole_x = 112.5;
porta_right_hole_y = 122.7;

portb_left_hole_x = 160;
portb_left_hole_y = 86.2;

portb_right_hole_x = 126;
portb_right_hole_y = 86.2;

portc_left_hole_x = 125.59;
portc_left_hole_y = 125.2;

portc_right_hole_x = 163.41;
portc_right_hole_y = 125.2;

mount_hole_left_x = 183.5;
mount_hole_left_y = 126.2;

mount_hole_right_x = 183.5;
mount_hole_right_y = 85.2;

board_edge_min_x = 107.5;
board_edge_min_y = 81.2;
board_edge_max_x = 187.5;
board_edge_max_y = 130.2;

board_size_x = board_edge_max_x-board_edge_min_x;
board_size_y = board_edge_max_y-board_edge_min_y;
board_centre_x = board_edge_min_x + board_size_x/2;
board_centre_y = board_edge_min_y + board_size_y/2;

echo ("board size is ", board_size_x, " by ", board_size_y);
echo ("board centre is ", board_centre_x, " & ", board_centre_y);

margin=6;

module hole(x,y) {
    echo (" hole at ", x, " by ", y);
    translate([x-board_centre_x, y-board_centre_y]) circle(d=hole_diameter, $fn=24);
}

difference() {
    hull() {
        translate([+board_size_x/2, +board_size_y/2]) circle(r=margin, $fn=24);
        translate([+board_size_x/2, -board_size_y/2]) circle(r=margin, $fn=24);
        translate([-board_size_x/2, +board_size_y/2]) circle(r=margin, $fn=24);
        translate([-board_size_x/2, -board_size_y/2]) circle(r=margin, $fn=24);
    }

    hole(porta_left_hole_x, porta_left_hole_y);
    hole(porta_right_hole_x, porta_right_hole_y);
    hole(portb_left_hole_x, portb_left_hole_y);
    hole(portb_right_hole_x, portb_right_hole_y);
    hole(portc_left_hole_x, portc_left_hole_y);
    hole(portc_right_hole_x, portc_right_hole_y);
    hole(mount_hole_left_x, mount_hole_left_y);
    hole(mount_hole_right_x, mount_hole_right_y);
}
        

