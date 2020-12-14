// *********************************************************************
// *                                                                   *
// *            Experimental Techniques in Particle Physics            *
// *                                                                   *
// * Geant 4 Tutorials -- Detector physics                             *
// * RWTH Aachen University                                            *
// * Karim LAIHEM and Andreas NOWACK                                   *
// *********************************************************************
//
//----------------------------------------------------------------------

#ifndef DetectorPhysDetectorConstruction_h
#define DetectorPhysDetectorConstruction_h 1

#include "G4VUserDetectorConstruction.hh"
#include "globals.hh"

class G4LogicalVolume;
class G4VPhysicalVolume;
class G4Material;

//----------------------------------------------------------------------

class DetectorPhysDetectorConstruction : public G4VUserDetectorConstruction
{
  public:
    DetectorPhysDetectorConstruction();
    ~DetectorPhysDetectorConstruction();

    G4VPhysicalVolume* Construct();

  private:
    //***********  World
    G4LogicalVolume*   logicWorld;
    G4VPhysicalVolume* physiWorld;
  
    //***********  Box 
    G4LogicalVolume*   LogicalChamberGasBox;
    G4VPhysicalVolume* PhysicalChamberGasBox;

    //***********  Material
    G4Material* Vacuum;

    //
    void DefineMaterials();
    G4VPhysicalVolume* ConstructSetUp();
};

//----------------------------------------------------------------------

#endif
