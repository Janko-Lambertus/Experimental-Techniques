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

#ifndef DetectorPhysPrimaryGeneratorAction_h
#define DetectorPhysPrimaryGeneratorAction_h 1

#include "G4VUserPrimaryGeneratorAction.hh"
#include "globals.hh"

class G4ParticleGun;
class G4Event;
class DetectorPhysDetectorConstruction;
class DetectorPhysPrimaryGeneratorMessenger;

//----------------------------------------------------------------------

class DetectorPhysPrimaryGeneratorAction : public G4VUserPrimaryGeneratorAction {
  public:
    DetectorPhysPrimaryGeneratorAction(DetectorPhysDetectorConstruction*);
    ~DetectorPhysPrimaryGeneratorAction();

    void GeneratePrimaries(G4Event*);

  private:
    G4ParticleGun*                         particleGun;          // pointer a to G4 class
    DetectorPhysDetectorConstruction*      DetectorPhysDetector; // pointer to the geometry
};

//----------------------------------------------------------------------

#endif
