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


    //***********  Box


    //***********  Material
    G4Material* Vacuum;
    G4Material* H2O;

  private:
    void DefineMaterials();
    G4VPhysicalVolume* ConstructSetUp();
};

//----------------------------------------------------------------------

#endif
