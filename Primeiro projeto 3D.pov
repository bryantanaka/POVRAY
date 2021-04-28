#include "colors.inc" // The include files contain
#include "stones.inc" // pre-defined scene elements 

#include "textures.inc" // pre-defined scene elements
#include "glass.inc"
#include "woods.inc"

#declare AMB = .5;
#declare DIF = .4;           

////////////////////////////////////////////// Movimentação da Câmera //////////////////////////////////////////////////////////
#switch (clock)
  #range (0,30)
    camera {
     location <100-(clock+5), 12, 0>
     look_at <50, 7, 0>
    }
  #break
  
  #range (30,32)  
    camera {
     location <65, 12, 0>
     look_at <50, 7, 0>
    }
  #break
  
  #range (32,45)
    camera {
     location <65, 12, 0>
     look_at <50-((clock-32)*2), 7, 0>
    }
  #break
  
  #range (45,58)
    camera {
     location <65, 12, 0>
     look_at <24+((clock-45)*2), 7, 0>
    }
  #break
  
  #range (58,63)
    camera {
     location <65, 12, 0>
     look_at <50, 7+(clock-58), 0>
    }
  #break
 
  #range (63,78)
    camera {
     location <65, 12, 0>
     look_at <0+((clock-63)*(65/15)), 12, 0-((clock-63)*(40/15))>
    }
  #break
  
  #range (78,93)
    camera {
     location <65, 12, 0-((clock-78)*2)>
     look_at <65,11,-39>
    }
  #break
  
  #range (93,108)
    camera {
     location <65, 12, -30>
     look_at <65-((clock-93)*(35/15)),11+((clock-93)*(29/15)),-39+((clock-93)*(4/15))>
    }
  #break
  
  #range (108,115)
    camera {
     location <65, 12, -30>
     look_at <30,30-((clock-108)*(18/7)),-35>
    }
  #break
  
  #range (115,125)
    camera {
     location <65, 12, -30>
     look_at <30+((clock-115)*(35/10)),12,-39+((clock-115)*(39/10))>
    }
  #break 
  
  #range (125,140)
    camera {
     location <65, 12, -30+((clock-125)*2)>
     look_at <65,12,0>
    }
  #break
  
  #range (140,155)
    camera {
     location <65, 12, 0>
     look_at <65-((clock-140)),12-((clock-140)*(5/15)),10-((clock-140)*(10/15))>
    }
  #break
  
  #range (155,170)
    camera {
     location <65-((clock-155)*(17.8/15)), 12-((clock-155)*(5/15)), 0>
     look_at <50-((clock-155)*(50/15)),7-((clock-115)*(2/15)),0>
    }
  #break
  
  #range (170,185)
    camera {
     location <20, 7, 0>
     look_at <0,4,0>     
    }
    
    sphere { <0, 5.2 + ((clock-170)*(10/15)), 0> 1 texture{ pigment { color White } } }
    
  #break
  
  #range (185,200)
    camera {
     location <20, 7, 0>
     look_at <0,4,0>     
    }
    
    sphere { <0, 15.2 - ((clock-185)*(5/15)), 0> 1 texture{ pigment { color White } } }
    
  #break
  
  #range (200,215)
    camera {
     location <20, 7, 0>
     look_at <0,4,0>     
    }
    
    sphere { <0, 10.2, 0> 1 texture{ pigment { color White } } }
    
  #break
  
  #range (215,239)
    camera {
     location <20, 7, 0>
     look_at <0,4,0>     
    }
    
    sphere { <0, 10.2, 0> 1 texture{ pigment { color White } } finish { Luminous } }
    
  #break
  
#end

#if (clock < 30) #declare luzDeGravacao = Glossy; #else #declare luzDeGravacao = Luminous; #end

#if (clock < 170) sphere { <0, 5.2 ,0> 1 texture{ pigment { color White } } } #end

background { color Black }

plane { <0, 1, 0>, -1
    texture {   
        pigment {
            color White
        }
    }
}

////////////////////////////////////////////Mesa  Central////////////////////////////////////////////
cylinder { <2, 4, 2>, <2, -1, 2> .2  texture {T_Wood1}}
cylinder { <2, 4, -2>, <2, -1, -2> .2  texture {T_Wood1}}
cylinder { <-2, 4, 2>, <-2, -1, 2> .2  texture {T_Wood1}}
cylinder { <-2, 4, -2>, <-2, -1, -2> .2  texture {T_Wood1}}
cylinder { <0, 4, 0>, <0, 4.3, 0> 3  texture {T_Wood1}}


///////////////////////////////////////////Luz de gravação///////////////////////////////////////////
box{<-20, 21, -5> <-21,24,5> pigment{color Red} finish {luzDeGravacao} }
        
/////////////////////////////////////////Luzes do teto///////////////////////////////////////////////
#declare xLuz = -10;                               
#declare yLuz = -30;

#for (i, 0, 2, 1) 
    #for (j, 0, 5, 1)
        
        object{
            cylinder {
                <xLuz + (j*20), 29,yLuz + (i*30)> <xLuz + (j*20), 27,yLuz + (i*30)> .2
                finish{
                    ambient AMB
                    diffuse DIF
                    phong 0.75
                    phong_size 25
                }
                pigment{ color Black } 
            }
        }
        
        object {
            cone {
                <xLuz + (j*20), 27,yLuz + (i*30)>, 0.3    // Center and radius of one end
                <xLuz + (j*20), 25,yLuz + (i*30)>, 0.8    // Center and radius of other end
                pigment{ color Gray }
                
                finish{
                    ambient AMB
                    diffuse DIF
                    phong 0.75
                    phong_size 25
                }
            }
        }
        
        object {
            sphere {
                <xLuz + (j*20), 25,yLuz + (i*30)>, 0.4    // Center and radius of one end
                pigment{ color White }
                #if (clock < 93)
                    finish{Luminous}
                #end
            }
        }
        
        #if (clock < 93)        
            light_source{ 
                <xLuz + (j*20), 24,yLuz + (i*30)> color rgb <1,1,1>
                cylinder
                radius 40
                tightness 10
                falloff 120
                point_at<xLuz + (j*20), 0, yLuz + (i*30)> 
            }
        #end
#end
#end


///////////////////////////////////////////// Painel Chroma ///////////////////////////////////////////
box {
   <-20, -1, -30>, <-20, 20, 30>
   pigment{ Green }
}

/////////////////////////////////////////////// paredes ///////////////////////////////////////////////
box {
   <-21, -1, -40>, <120, 30, 40>
   texture{
     pigment{ brick
              color White
              color rgb<0.8,0.25,0.1>
              brick_size <5, 1, 2.5 >
              mortar 0.25
            }
     normal { wrinkles 0.5 scale 0.01}
   }
}

/////////////////////////////////////////////// teto ///////////////////////////////////////////////
box {
   <-21, 29, -40>, <120, 31, 40>
   texture{
     pigment{ brick
              color Black
              color rgb<0.7,0.7,0.7>
              brick_size <10, 1, 10 >
              mortar .5
            }
     normal { wrinkles 0.5 scale 0.01}
   }
}

///////////////////////////////////////////// Cameras filmadoras /////////////////////////////////////////////
#declare xCentro = 50; 
#declare yCentro = 0;

cylinder { 
    <xCentro, 6, yCentro>, <xCentro+2, -1, yCentro> .2  
    finish{
        ambient AMB
        diffuse DIF
        phong 0.75
        phong_size 25
    }
    pigment{ color Black }    
}

cylinder { 
    <xCentro, 6, yCentro>, <xCentro-1, -1, yCentro+2> .2  
    finish{
        ambient AMB
        diffuse DIF
        phong 0.75
        phong_size 25
    }
    pigment{ color Black }    
}

cylinder { 
    <xCentro, 6, yCentro>, <xCentro-1, -1, yCentro-2> .2  
    finish{
        ambient AMB
        diffuse DIF
        phong 0.75
        phong_size 25
    }
    pigment{ color Black }    
}

box {
    <xCentro-1, 8, yCentro-2>, <xCentro+1, 6, yCentro+2>
    finish{
        ambient AMB
        diffuse DIF
        phong 0.75
        phong_size 25
    }
    pigment{ color Black }
}

cylinder { 
    <xCentro, 7, yCentro>, <xCentro-3, 7, yCentro> .9  
    finish{
        ambient AMB
        diffuse DIF
        phong 0.75
        phong_size 25
    }
    pigment{ color Black }    
}

box { <xCentro+1.1, 7.7, yCentro-1.8>, <xCentro+1.1, 6.3, yCentro+0.7> pigment{ color Black  } finish { Glossy }}

sphere { <xCentro-2.8, 7, yCentro> .8 texture{ Glass3 }}

sphere { <xCentro+1, 7.6, yCentro+1.6> .2 pigment{ color Red } finish { luzDeGravacao } }

///////////////////////////////////////////// Soft Box /////////////////////////////////////////////
#declare xCentro = 20; 
#declare yCentro = -10;

cylinder { 
    <xCentro, 3, yCentro>, <xCentro+2, -1, yCentro> .2  
    finish{
        ambient AMB
        diffuse DIF
        phong 0.75
        phong_size 25
    }
    rotate <0,45,0>
    pigment{ color Black }    
}

cylinder { 
    <xCentro, 3, yCentro>, <xCentro-1, -1, yCentro+2> .2  
    finish{
        ambient AMB
        diffuse DIF
        phong 0.75
        phong_size 25
    }
    rotate <0,45,0>
    pigment{ color Black }    
}

cylinder { 
    <xCentro, 3, yCentro>, <xCentro-1, -1, yCentro-2> .2  
    finish{
        ambient AMB
        diffuse DIF
        phong 0.75
        phong_size 25
    }
    rotate <0,45,0>
    pigment{ color Black }    
}

cylinder { 
    <xCentro, 8, yCentro>, <xCentro, -1, yCentro> .2  
    finish{
        ambient AMB
        diffuse DIF
        phong 0.75
        phong_size 25
    }
    rotate <0,45,0>
    pigment{ color Black }    
}

triangle
{
        <xCentro, 8 ,yCentro>, <xCentro - 4, 4, yCentro - 2>, <xCentro - 4, 12, yCentro - 2>
        finish{
            ambient AMB
            diffuse DIF
            phong 0.75
            phong_size 25
        }
        rotate <0,45,0>
        pigment{ color Black }
}
 
triangle
{
        <xCentro, 8 ,yCentro>, <xCentro - 4, 4, yCentro + 2>, <xCentro - 4, 12, yCentro + 2>
        finish{
            ambient AMB
            diffuse DIF
            phong 0.75
            phong_size 25
        }
        rotate <0,45,0>
        pigment{ color Black }
}

triangle
{
        <xCentro, 8 ,yCentro>, <xCentro - 4, 4, yCentro + 2>, <xCentro - 4, 4, yCentro - 2>
        finish{
            ambient AMB
            diffuse DIF
            phong 0.75
            phong_size 25
        }
        rotate <0,45,0>
        pigment{ color Black }
}

triangle
{
        <xCentro, 8 ,yCentro>, <xCentro - 4, 12, yCentro + 2>, <xCentro - 4, 12, yCentro - 2>
        finish{
            ambient AMB
            diffuse DIF
            phong 0.75
            phong_size 25
        }
        rotate <0,45,0>
        pigment{ color Black }
}

box {
    <xCentro-4.1, 4.2, yCentro-1.8>, <xCentro-4.1, 11.8, yCentro+1.8> pigment{ color White  } finish { Luminous } rotate <0,45,0>
}

light_source{                                                       
    <xCentro-4.2, 8,yCentro> color rgb <1,1,1>
    area_light <xCentro-4.2, 4.2, yCentro-1.8>, <xCentro-4.2, 11.8, yCentro+1.8>, 4, 2
    cylinder
    radius 40
    tightness 10
    falloff 120
    point_at<0, 0, 0>
}
 
                                                             
///////////////////////////////////////////// Soft Box 2 /////////////////////////////////////////////
#declare xCentro = 20; 
#declare yCentro = 10;

cylinder { 
    <xCentro, 3, yCentro>, <xCentro+2, -1, yCentro> .2  
    finish{
        ambient AMB
        diffuse DIF
        phong 0.75
        phong_size 25
    }
    rotate <0,-45,0>
    pigment{ color Black }    
}

cylinder { 
    <xCentro, 3, yCentro>, <xCentro-1, -1, yCentro+2> .2  
    finish{
        ambient AMB
        diffuse DIF
        phong 0.75
        phong_size 25
    }
    rotate <0,-45,0>
    pigment{ color Black }    
}

cylinder { 
    <xCentro, 3, yCentro>, <xCentro-1, -1, yCentro-2> .2  
    finish{
        ambient AMB
        diffuse DIF
        phong 0.75
        phong_size 25
    }
    rotate <0,-45,0>
    pigment{ color Black }    
}

cylinder { 
    <xCentro, 8, yCentro>, <xCentro, -1, yCentro> .2  
    finish{
        ambient AMB
        diffuse DIF
        phong 0.75
        phong_size 25
    }
    rotate <0,-45,0>
    pigment{ color Black }    
}

triangle
{
        <xCentro, 8 ,yCentro>, <xCentro - 4, 4, yCentro - 2>, <xCentro - 4, 12, yCentro - 2>
        finish{
            ambient AMB
            diffuse DIF
            phong 0.75
            phong_size 25
        }
        rotate <0,-45,0>
        pigment{ color Black }
}
 
triangle
{
        <xCentro, 8 ,yCentro>, <xCentro - 4, 4, yCentro + 2>, <xCentro - 4, 12, yCentro + 2>
        finish{
            ambient AMB
            diffuse DIF
            phong 0.75
            phong_size 25
        }
        rotate <0,-45,0>
        pigment{ color Black }
}

triangle
{
        <xCentro, 8 ,yCentro>, <xCentro - 4, 4, yCentro + 2>, <xCentro - 4, 4, yCentro - 2>
        finish{
            ambient AMB
            diffuse DIF
            phong 0.75
            phong_size 25
        }
        rotate <0,-45,0>
        pigment{ color Black }
}

triangle
{
        <xCentro, 8 ,yCentro>, <xCentro - 4, 12, yCentro + 2>, <xCentro - 4, 12, yCentro - 2>
        finish{
            ambient AMB
            diffuse DIF
            phong 0.75
            phong_size 25
        }
        rotate <0,-45,0>
        pigment{ color Black }
}

box {
    <xCentro-4.1, 4.2, yCentro-1.8>, <xCentro-4.1, 11.8, yCentro+1.8> pigment{ color White  } finish { Luminous } rotate <0,-45,0>
}

light_source{                                                       
    <xCentro-4.2, 8,yCentro> color rgb <1,1,1>
    area_light <xCentro-4.2, 4.2, yCentro-1.8>, <xCentro-4.2, 11.8, yCentro+1.8>, 4, 2
    cylinder
    radius 40
    tightness 10
    falloff 120
    point_at<0, 0, 0>
}

//////////////////////////////////////////////// Poltronas ////////////////////////////////////////////////

#declare xCentro = 0; 
#declare yCentro = -12;

cylinder { 
    <xCentro-2, -1, yCentro-2>, <xCentro-1.5, 2, yCentro-1.5> .2    rotate <0,45,0>    texture {T_Wood2}    
}

cylinder { 
    <xCentro+2, -1, yCentro+2>, <xCentro+1.5, 2, yCentro+1.5> .2    rotate <0,45,0>    texture {T_Wood2}    
}

cylinder { 
    <xCentro+2, -1, yCentro-2>, <xCentro+1.5, 2, yCentro-1.5> .2    rotate <0,45,0>    texture {T_Wood2}
}

cylinder { 
    <xCentro-2, -1, yCentro+2>, <xCentro-1.5, 2, yCentro+1.5> .2    rotate <0,45,0>    texture {T_Wood2}
}
 
box {
    <xCentro-3, 1.8, yCentro-3>, <xCentro+3, 2.5, yCentro+3> 
    texture { 
        pigment { 
            marble color_map { 
                [0.0 rgb <0.62,0.46,0.34>*1.5 ] [1.0 rgb <0.52,0.46,0.34>*1.6 ]
            }
            turbulence 0.15
            scale 10
        }
        finish { ambient 0.3 diffuse 0.6 reflection 0.01 }
        normal { quilted 1 control0 0.5 control1 0.9 scale 0.24 turbulence 1 }
    }
    
    rotate <0,45,0>
}

box {
    <xCentro-3, 1.8, yCentro-2>, <xCentro+3, 7, yCentro-3> 
    texture { 
        pigment { 
            marble color_map { 
                [0.0 rgb <0.52,0.46,0.34>*1.5 ] [1.0 rgb <0.52,0.46,0.34>*1.6 ]
            }
            turbulence 0.15
            scale 10
        }
        finish { ambient 0.3 diffuse 0.6 reflection 0.01 }
        normal { quilted 1 control0 0.5 control1 0.9 scale 0.24 turbulence 1 }
    }
    
    rotate <0,45,0>
}

box {
    <xCentro+3, 1.8, yCentro-2>, <xCentro+3, 5.5, yCentro+3> 
    texture { 
        pigment { 
            marble color_map { 
                [0.0 rgb <0.52,0.46,0.34>*1.5 ] [1.0 rgb <0.52,0.46,0.34>*1.6 ]
            }
            turbulence 0.15
            scale 10
        }
        finish { ambient 0.3 diffuse 0.6 reflection 0.01 }
        normal { quilted 1 control0 0.5 control1 0.9 scale 0.24 turbulence 1 }
    }
    
    rotate <0,45,0>
}

box {
    <xCentro-3, 1.8, yCentro-2>, <xCentro-3, 5.5, yCentro+3> 
    texture { 
        pigment { 
            marble color_map { 
                [0.0 rgb <0.52,0.46,0.34>*1.5 ] [1.0 rgb <0.52,0.46,0.34>*1.6 ]
            }
            turbulence 0.15
            scale 10
        }
        finish { ambient 0.3 diffuse 0.6 reflection 0.01 }
        normal { quilted 1 control0 0.5 control1 0.9 scale 0.24 turbulence 1 }
    }
    rotate <0,45,0>
}

//////////////////////////////////////////////// Poltronas 2 ////////////////////////////////////////////////

#declare xCentro = 0; 
#declare yCentro = -12;

cylinder { 
    <xCentro-2, -1, yCentro-2>, <xCentro-1.5, 2, yCentro-1.5> .2    rotate <0,135,0>    texture {T_Wood2}    
}

cylinder { 
    <xCentro+2, -1, yCentro+2>, <xCentro+1.5, 2, yCentro+1.5> .2    rotate <0,135,0>    texture {T_Wood2}    
}

cylinder { 
    <xCentro+2, -1, yCentro-2>, <xCentro+1.5, 2, yCentro-1.5> .2    rotate <0,135,0>    texture {T_Wood2}
}

cylinder { 
    <xCentro-2, -1, yCentro+2>, <xCentro-1.5, 2, yCentro+1.5> .2    rotate <0,135,0>    texture {T_Wood2}
}
 
box {
    <xCentro-3, 1.8, yCentro-3>, <xCentro+3, 2.5, yCentro+3> 
    texture { 
        pigment { 
            marble color_map { 
                [0.0 rgb <0.62,0.46,0.34>*1.5 ] [1.0 rgb <0.52,0.46,0.34>*1.6 ]
            }
            turbulence 0.15
            scale 10
        }
        finish { ambient 0.3 diffuse 0.6 reflection 0.01 }
        normal { quilted 1 control0 0.5 control1 0.9 scale 0.24 turbulence 1 }
    }
    
    rotate <0,135,0>
}

box {
    <xCentro-3, 1.8, yCentro-2>, <xCentro+3, 7, yCentro-3> 
    texture { 
        pigment { 
            marble color_map { 
                [0.0 rgb <0.52,0.46,0.34>*1.5 ] [1.0 rgb <0.52,0.46,0.34>*1.6 ]
            }
            turbulence 0.15
            scale 10
        }
        finish { ambient 0.3 diffuse 0.6 reflection 0.01 }
        normal { quilted 1 control0 0.5 control1 0.9 scale 0.24 turbulence 1 }
    }
    
    rotate <0,135,0>
}

box {
    <xCentro+3, 1.8, yCentro-2>, <xCentro+3, 5.5, yCentro+3> 
    texture { 
        pigment { 
            marble color_map { 
                [0.0 rgb <0.52,0.46,0.34>*1.5 ] [1.0 rgb <0.52,0.46,0.34>*1.6 ]
            }
            turbulence 0.15
            scale 10
        }
        finish { ambient 0.3 diffuse 0.6 reflection 0.01 }
        normal { quilted 1 control0 0.5 control1 0.9 scale 0.24 turbulence 1 }
    }
    
    rotate <0,135,0>
}

box {
    <xCentro-3, 1.8, yCentro-2>, <xCentro-3, 5.5, yCentro+3> 
    texture { 
        pigment { 
            marble color_map { 
                [0.0 rgb <0.52,0.46,0.34>*1.5 ] [1.0 rgb <0.52,0.46,0.34>*1.6 ]
            }
            turbulence 0.15
            scale 10
        }
        finish { ambient 0.3 diffuse 0.6 reflection 0.01 }
        normal { quilted 1 control0 0.5 control1 0.9 scale 0.24 turbulence 1 }
    }
    rotate <0,135,0>
}

/////////////////////////////////////////////////Interruptor/////////////////////////////////////////////////////////

box { <64,7,-39> <66,11,-38> texture{ pigment{ color White  }  }}
box { <64.8,8,-37.2> <65.2,10,-37> texture{ pigment{ color Gray  }}}
