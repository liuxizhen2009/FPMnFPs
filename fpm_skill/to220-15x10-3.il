;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Transistor/Through hole transistor
;Desc:TO220-3pin with heatsink
;Vendor: stavrosatic@gmail.com
;Count:1

pA=15.0 pB=10.0 pH=26.0 pPad=1.85 pHole=1.2 Courtyard=1.0 Pitch=3.5

pName="TO220-15x10-3"
_PrepareNewSym(pName)

PadN=_PadTH_Default(pPad pHole)
 
ofs = -pA/2+3.0
_CreatePin(PadN -Pitch:-pB/2+1.5 "1")
_CreatePin(PadN 0:-pB/2+1.5  "2")
_CreatePin(PadN Pitch:-pB/2+1.5 "3")

;Place��
_Layer(lPkgGeoPlaceT) ;�л���PlaceTop��
_BoundHeight(_ShapeRectangle(pA+Courtyard pB+Courtyard) pH)
_Layer(lPkgGeoDfaT) ;�л���PlaceTop��
_BoundHeight(_ShapeRectangle(pA pB) pH pName)

for(asm 0 1 ;˿ӡ��װ���
    if(asm==1 _Layer(lPkgGeoAsmT) 
        _Layer(lPkgGeoSilkT))
	_Line(list(-5:-pB/2 -5:-pB/2+4))
	_Line(list(5:-pB/2 5:-pB/2+4))
	_Line(list(-5:-pB/2+4 5:-pB/2+4)) 
	_Rectangle(pA pB)
)

_CreateRefValue(pName) 
_SaveDesign(pName)
_MakeDevice(pName,2)
