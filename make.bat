@echo off

set BUILD_20MM=0
set BUILD_25MM=0
set BUILD_30MM=1
set BUILD_32MM=0
set BUILD_HORSES=0

set OPENSCAD="C:\Program Files\OpenSCAD\openscad.exe"

IF %BUILD_20MM% == 1 (

%OPENSCAD% -D texture="""plain""" -D cols=5 -D rows=2 -D base_r=10.25 -o tray_5x2ph_20mm.png movement_tray.scad
%OPENSCAD% -D texture="""plain""" -D cols=5 -D rows=2 -D base_r=10.25 --export-format binstl -o tray_5x2ph_20mm.stl movement_tray.scad
%OPENSCAD% -D texture="""plain""" -D cols=5 -D rows=2 -D base_r=10.25 -D handle_active=false -o tray_5x2p_20mm.png movement_tray.scad
%OPENSCAD% -D texture="""plain""" -D cols=5 -D rows=2 -D base_r=10.25 -D handle_active=false --export-format binstl -o tray_5x2p_20mm.stl movement_tray.scad

%OPENSCAD% -D texture="""plain""" -D cols=5 -D rows=1 -D base_r=10.25 -o tray_5x1ph_20mm.png movement_tray.scad
%OPENSCAD% -D texture="""plain""" -D cols=5 -D rows=1 -D base_r=10.25 --export-format binstl -o tray_5x1ph_20mm.stl movement_tray.scad
%OPENSCAD% -D texture="""plain""" -D cols=5 -D rows=1 -D base_r=10.25 -D handle_active=false -o tray_5x1p_20mm.png movement_tray.scad
%OPENSCAD% -D texture="""plain""" -D cols=5 -D rows=1 -D base_r=10.25 -D handle_active=false --export-format binstl -o tray_5x1p_20mm.stl movement_tray.scad

%OPENSCAD% -D texture="""bricks""" -D cols=5 -D rows=2 -D base_r=10.25 -o tray_5x2bh_20mm.png movement_tray.scad
%OPENSCAD% -D texture="""bricks""" -D cols=5 -D rows=2 -D base_r=10.25 --export-format binstl -o tray_5x2bh_20mm.stl movement_tray.scad
%OPENSCAD% -D texture="""bricks""" -D cols=5 -D rows=2 -D base_r=10.25 -D handle_active=false -o tray_5x2b_20mm.png movement_tray.scad
%OPENSCAD% -D texture="""bricks""" -D cols=5 -D rows=2 -D base_r=10.25 -D handle_active=false --export-format binstl -o tray_5x2b_20mm.stl movement_tray.scad

%OPENSCAD% -D texture="""bricks""" -D cols=5 -D rows=1 -D base_r=10.25 -o tray_5x1bh_20mm.png movement_tray.scad
%OPENSCAD% -D texture="""bricks""" -D cols=5 -D rows=1 -D base_r=10.25 --export-format binstl -o tray_5x1bh_20mm.stl movement_tray.scad
%OPENSCAD% -D texture="""bricks""" -D cols=5 -D rows=1 -D base_r=10.25 -D handle_active=false -o tray_5x1b_20mm.png movement_tray.scad
%OPENSCAD% -D texture="""bricks""" -D cols=5 -D rows=1 -D base_r=10.25 -D handle_active=false --export-format binstl -o tray_5x1b_20mm.stl movement_tray.scad

)

IF %BUILD_25MM% == 1 (

%OPENSCAD% -D texture="""plain""" -D cols=5 -D rows=1 -o tray_5x1ph_25mm.png -q --autocenter movement_tray.scad
%OPENSCAD% -D texture="""plain""" -D cols=5 -D rows=1 --export-format binstl -o tray_5x1ph_25mm.stl movement_tray.scad
%OPENSCAD% -D texture="""plain""" -D cols=5 -D rows=1 -D handle_active=false -o tray_5x1p_25mm.png -q --autocenter movement_tray.scad
%OPENSCAD% -D texture="""plain""" -D cols=5 -D rows=1 -D handle_active=false --export-format binstl -o tray_5x1p_25mm.stl movement_tray.scad

%OPENSCAD% -D texture="""plain""" -D cols=5 -D rows=2 -o tray_5x2ph_25mm.png -q --autocenter tray_render.scad
%OPENSCAD% -D texture="""plain"""  -D cols=5 -D rows=2 --export-format binstl -o tray_5x2ph_25mm.stl tray_render.scad
%OPENSCAD% -D texture="""plain""" -D cols=5 -D rows=2 -D handle_active=false -o tray_5x2p_25mm.png -q --autocenter tray_render.scad
%OPENSCAD% -D texture="""plain"""  -D cols=5 -D rows=2 -D handle_active=false --export-format binstl -o tray_5x2p_25mm.stl tray_render.scad

%OPENSCAD% -D texture="""bricks""" -D cols=5 -D rows=1 -o tray_5x1bh_25mm.png -q --autocenter tray_render.scad
%OPENSCAD% -D texture="""bricks""" -D cols=5 -D rows=1 --export-format binstl -o tray_5x1bh_25mm.stl movement_tray.scad
%OPENSCAD% -D texture="""bricks""" -D cols=5 -D rows=1 -D handle_active=false -o tray_5x1b_25mm.png -q --autocenter tray_render.scad
%OPENSCAD% -D texture="""bricks""" -D cols=5 -D rows=1 -D handle_active=false --export-format binstl -o tray_5x1b_25mm.stl movement_tray.scad

%OPENSCAD% -D texture="""bricks""" -D cols=5 -D rows=2 -o tray_5x2bh_25mm.png -q --autocenter tray_render.scad
%OPENSCAD% -D texture="""bricks""" -D cols=5 -D rows=2 --export-format binstl -o tray_5x2bh_25mm.stl movement_tray.scad
%OPENSCAD% -D texture="""bricks""" -D cols=5 -D rows=2 -D handle_active=false -o tray_5x2b_25mm.png -q --autocenter tray_render.scad
%OPENSCAD% -D texture="""bricks""" -D cols=5 -D rows=2 -D handle_active=false --export-format binstl -o tray_5x2b_25mm.stl movement_tray.scad

)

IF %BUILD_30MM% == 1 (

%OPENSCAD% -D texture="""plain""" -D cols=3 -D rows=1 -D base_r=15.25 -D handle2_row=1 -o tray_3x1ph_30mm.png -q --autocenter movement_tray.scad
%OPENSCAD% -D texture="""plain""" -D cols=3 -D rows=1 -D base_r=15.25 -D handle2_row=1 --export-format binstl -o tray_3x1ph_30mm.stl movement_tray.scad
%OPENSCAD% -D texture="""plain""" -D cols=3 -D rows=1 -D base_r=15.25 -D handle2_row=1 -D handle_active=false -o tray_3x1p_30mm.png -q --autocenter movement_tray.scad
%OPENSCAD% -D texture="""plain""" -D cols=3 -D rows=1 -D base_r=15.25 -D handle2_row=1 -D handle_active=false --export-format binstl -o tray_3x1p_30mm.stl movement_tray.scad

%OPENSCAD% -D texture="""plain""" -D cols=5 -D rows=1 -D base_r=15.25 -o tray_5x1ph_30mm.png -q --autocenter movement_tray.scad
%OPENSCAD% -D texture="""plain""" -D cols=5 -D rows=1 -D base_r=15.25 --export-format binstl -o tray_5x1ph_30mm.stl movement_tray.scad
%OPENSCAD% -D texture="""plain""" -D cols=5 -D rows=1 -D base_r=15.25 -D handle_active=false -o tray_5x1p_30mm.png -q --autocenter movement_tray.scad
%OPENSCAD% -D texture="""plain""" -D cols=5 -D rows=1 -D base_r=15.25 -D handle_active=false --export-format binstl -o tray_5x1p_30mm.stl movement_tray.scad

%OPENSCAD% -D texture="""bricks""" -D cols=3 -D rows=1 -D base_r=15.25 -D handle2_row=1 -o tray_3x1bh_32mm.png -q --autocenter movement_tray.scad
%OPENSCAD% -D texture="""bricks""" -D cols=3 -D rows=1 -D base_r=15.25 -D handle2_row=1 --export-format binstl -o tray_3x1bh_30mm.stl movement_tray.scad
%OPENSCAD% -D texture="""bricks""" -D cols=3 -D rows=1 -D base_r=15.25 -D handle2_row=1 -D handle_active=false -o tray_3x1b_30mm.png -q --autocenter movement_tray.scad
%OPENSCAD% -D texture="""bricks""" -D cols=3 -D rows=1 -D base_r=15.25 -D handle2_row=1 -D handle_active=false --export-format binstl -o tray_3x1b_30mm.stl movement_tray.scad

%OPENSCAD% -D texture="""bricks""" -D cols=5 -D rows=1 -D base_r=15.25 -o tray_5x1bh_30mm.png -q --autocenter movement_tray.scad
%OPENSCAD% -D texture="""bricks""" -D cols=5 -D rows=1 -D base_r=15.25 --export-format binstl -o tray_5x1bh_30mm.stl movement_tray.scad
%OPENSCAD% -D texture="""bricks""" -D cols=5 -D rows=1 -D base_r=15.25 -D handle_active=false -o tray_5x1b_30mm.png -q --autocenter movement_tray.scad
%OPENSCAD% -D texture="""bricks""" -D cols=5 -D rows=1 -D base_r=15.25 -D handle_active=false --export-format binstl -o tray_5x1b_30mm.stl movement_tray.scad

)

IF %BUILD_32MM% == 1 (

%OPENSCAD% -D texture="""plain""" -D cols=3 -D rows=1 -D base_r=16.25 -D handle2_row=1 -o tray_3x1ph_32mm.png -q --autocenter movement_tray.scad
%OPENSCAD% -D texture="""plain""" -D cols=3 -D rows=1 -D base_r=16.25 -D handle2_row=1 --export-format binstl -o tray_3x1ph_32mm.stl movement_tray.scad
%OPENSCAD% -D texture="""plain""" -D cols=3 -D rows=1 -D base_r=16.25 -D handle2_row=1 -D handle_active=false -o tray_3x1p_32mm.png -q --autocenter movement_tray.scad
%OPENSCAD% -D texture="""plain""" -D cols=3 -D rows=1 -D base_r=16.25 -D handle2_row=1 -D handle_active=false --export-format binstl -o tray_3x1p_32mm.stl movement_tray.scad

%OPENSCAD% -D texture="""plain""" -D cols=5 -D rows=1 -D base_r=16.25 -o tray_5x1ph_32mm.png -q --autocenter movement_tray.scad
%OPENSCAD% -D texture="""plain""" -D cols=5 -D rows=1 -D base_r=16.25 --export-format binstl -o tray_5x1ph_32mm.stl movement_tray.scad
%OPENSCAD% -D texture="""plain""" -D cols=5 -D rows=1 -D base_r=16.25 -D handle_active=false -o tray_5x1p_32mm.png -q --autocenter movement_tray.scad
%OPENSCAD% -D texture="""plain""" -D cols=5 -D rows=1 -D base_r=16.25 -D handle_active=false --export-format binstl -o tray_5x1p_32mm.stl movement_tray.scad

%OPENSCAD% -D texture="""bricks""" -D cols=3 -D rows=1 -D base_r=16.25 -D handle2_row=1 -o tray_3x1bh_32mm.png -q --autocenter movement_tray.scad
%OPENSCAD% -D texture="""bricks""" -D cols=3 -D rows=1 -D base_r=16.25 -D handle2_row=1 --export-format binstl -o tray_3x1bh_32mm.stl movement_tray.scad
%OPENSCAD% -D texture="""bricks""" -D cols=3 -D rows=1 -D base_r=16.25 -D handle2_row=1 -D handle_active=false -o tray_3x1b_32mm.png -q --autocenter movement_tray.scad
%OPENSCAD% -D texture="""bricks""" -D cols=3 -D rows=1 -D base_r=16.25 -D handle2_row=1 -D handle_active=false --export-format binstl -o tray_3x1b_32mm.stl movement_tray.scad

%OPENSCAD% -D texture="""bricks""" -D cols=5 -D rows=1 -D base_r=16.25 -o tray_5x1bh_32mm.png -q --autocenter movement_tray.scad
%OPENSCAD% -D texture="""bricks""" -D cols=5 -D rows=1 -D base_r=16.25 --export-format binstl -o tray_5x1bh_32mm.stl movement_tray.scad
%OPENSCAD% -D texture="""bricks""" -D cols=5 -D rows=1 -D base_r=16.25 -D handle_active=false -o tray_5x1b_32mm.png -q --autocenter movement_tray.scad
%OPENSCAD% -D texture="""bricks""" -D cols=5 -D rows=1 -D base_r=16.25 -D handle_active=false --export-format binstl -o tray_5x1b_32mm.stl movement_tray.scad

)

IF %BUILD_HORSES% == 1 (

%OPENSCAD% -D texture="""plain""" -o tray_5x1ph_50x30mm.png -q --autocenter movement_tray_horses.scad
%OPENSCAD% -D texture="""plain""" --export-format binstl -o tray_5x1ph_50x30mm.stl movement_tray_horses.scad
%OPENSCAD% -D texture="""plain""" -o tray_5x1p_50x30mm.png -D handle_active=false -q --autocenter movement_tray_horses.scad
%OPENSCAD% -D texture="""plain""" -D handle_active=false --export-format binstl -o tray_5x1p_50x30mm.stl movement_tray_horses.scad

%OPENSCAD% -D texture="""bricks""" -o tray_5x1bh_50x30mm.png -q --autocenter movement_tray_horses.scad
%OPENSCAD% -D texture="""bricks""" --export-format binstl -o tray_5x1bh_50x30mm.stl movement_tray_horses.scad
%OPENSCAD% -D texture="""bricks""" -o tray_5x1b_50x30mm.png -D handle_active=false -q --autocenter movement_tray_horses.scad
%OPENSCAD% -D texture="""bricks""" -D handle_active=false --export-format binstl -o tray_5x1b_50x30mm.stl movement_tray_horses.scad

)