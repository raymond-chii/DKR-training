
MODULE raynew
    CONST robtarget pickabove:= [[811.34,-145.15,259.67],[0.0272241,-0.709909,-0.703474,0.0203113],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget drop1 := [[-84.22,922.77,3.64],[0.0324582,-0.00748964,-0.999434,0.00468858],[1,0,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    VAR num boxheight:= 56;
    
	PROC rAY()
        
        
        FOR i FROM 0 TO 3 DO
            MoveABsJ Home, v1000,z50, Gripper1;
		    MoveJ pickabove, v1000, z50, Gripper1;
            MoveJ [[811.34,-145.15,159.67 - i*boxheight],[0.0272241,-0.709909,-0.703474,0.0203113],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z50, Gripper1;
            SetDO doHvataljka,1;
            
            IF i = 0 THEN 
                    MoveABsJ Home, v1000,z50, Gripper1;
                    MoveJ offs(drop1, 0,0,100), v1000, z50, Gripper1;
		            MoveJ drop1, v1000, z50, Gripper1;
                    SetDO doHvataljka,0;
                    
            ELSEIF i = 1 THEN
                    MoveABsJ Home, v1000,z50, Gripper1;
                    MoveJ offs(drop1, 0,-244, 100), v1000, z50, Gripper1;
                    MoveJ offs(drop1, 0,-244, 0), v1000, z50, Gripper1;
                    SetDO doHvataljka,0;
                    
            ELSEIF i = 2 THEN
                    MoveABsJ Home, v1000,z50, Gripper1;
                    MoveJ offs(drop1, 276,-244, 100), v1000, z50, Gripper1;
                    MoveJ offs(drop1, 276,-244, 0), v1000, z50, Gripper1;
                    SetDO doHvataljka,0;
                    
            ELSE
                    MoveABsJ Home, v1000,z50, Gripper1;
                    MoveJ offs(drop1, 276,0, 100), v1000, z50, Gripper1;
                    MoveJ offs(drop1, 276,0, 0), v1000, z50, Gripper1;
                    SetDO doHvataljka,0;
                    
            ENDIF
        
         ENDFOR        
        
          MoveABsJ Home, v1000,z50, Gripper1;      

	ENDPROC

ENDMODULE