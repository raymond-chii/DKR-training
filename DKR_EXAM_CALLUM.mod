
MODULE CALLUM_EXAM
    PERS tooldata Gripper15:=[TRUE,[[0,0,117.12],[1,0,0,0]],[0.5,[4007.96,-1666.27,-2260.59],[1,0,0,0],0,0,0]];
    CONST robtarget BoxPick := [[1146.37,495.21,241.88],[0.00827536,0.696621,-0.717333,0.00912401],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget BoxPlace := [[336.27,1132.49,-2],[0.00827853,0.696627,-0.717327,0.00912854],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget ProgMid:=[[933.500179826,873.610135407,382.289875043],[0.00827587,0.696626,-0.717329,0.00912793],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget PosHOMER:=[[1075.781535242,335.412720363,756.545651942],[0.000049179,-0.707080014,-0.707133542,0.000061905],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    VAR num XOffset := 280.00;
    VAR num YOffset := -250;
    VAR num box_height := 56;
    
	PROC CAL_EXAMMY()
	     !MoveJ PosHOMER,v1000,z50,Gripper15; 
        MoveAbsJ [[17.3164,26.5923,32.1025,0,58,-162.689],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]]\NoEOffs,v1000,z50,Gripper15;    
        FOR i FROM 0 TO 3 DO            
            MoveJ Offs(BoxPick,0,0,50),v1000,z50,Gripper15; !Move Above the position where we are placing the box
            MoveL Offs(BoxPick,0,0,-i*box_height),v600,fine,Gripper15; !Placebox in Place Location
            SetDO D_652_10_OUT0, 1; !Set Digital Output Low, turn suction cup off
            MoveJ ProgMid,v1000,z20,Gripper15; !Move to mid point
            IF i = 0 THEN
                MoveJ Offs(BoxPlace,0,0,50),v1000,z50,Gripper15; !Move Above the position where we are placing the box
                MoveL Offs(BoxPlace,0,0,0),v600,fine,Gripper15; !Placebox in Place Location
                SetDO D_652_10_OUT0, 0; !Set Digital Output Low, turn suction cup off
                WaitTime 0.5;
                MoveL Offs(BoxPlace,0,0,50),v1000,z20,Gripper15; !Move Above 50mm the position where we are placing the box
            ELSEIF i = 1 THEN
                MoveJ Offs(BoxPlace,XOffset,0,50),v1000,z50,Gripper15; !Move Above the position where we are placing the box
                MoveL Offs(BoxPlace,XOffset,0,0),v600,fine,Gripper15; !Placebox in Place Location
                SetDO D_652_10_OUT0, 0; !Set Digital Output Low, turn suction cup off
                WaitTime 0.5;
                MoveL Offs(BoxPlace,XOffset,0,50),v1000,z20,Gripper15; !Move Above 50mm the position where we are placing the box
            ELSEIF i = 2 THEN
                MoveJ Offs(BoxPlace,XOffset,YOffset,50),v1000,z50,Gripper15; !Move Above the position where we are placing the box
                MoveL Offs(BoxPlace,XOffset,YOffset,0),v1000,fine,Gripper15; !Placebox in Place Location
                SetDO D_652_10_OUT0, 0; !Set Digital Output Low, turn suction cup off
                WaitTime 0.5;
                MoveL Offs(BoxPlace,XOffset,YOffset,50),v1000,z20,Gripper15; !Move Above 50mm the position where we are placing the box
            ELSEIF i = 3 THEN
                MoveJ Offs(BoxPlace,0,YOffset,50),v1000,z50,Gripper15; !Move Above the position where we are placing the box
                MoveL Offs(BoxPlace,0,YOffset,0),v1000,fine,Gripper15; !Placebox in Place Location
                SetDO D_652_10_OUT0, 0; !Set Digital Output Low, turn suction cup off
                WaitTime 0.5;
                MoveL Offs(BoxPlace,0,YOffset,50),v1000,z20,Gripper15; !Move Above 50mm the position where we are placing the box
            ENDIF
            MoveJ ProgMid,v1000,z50,Gripper15; !Move to mid point
        ENDFOR

    MoveAbsJ [[17.3164,26.5923,32.1025,0,58,-162.689],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]]\NoEOffs,v1000,z50,Gripper15;
	ENDPROC

ENDMODULE
