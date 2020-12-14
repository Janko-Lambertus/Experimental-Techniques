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

#ifndef DetectorPhysPhysicsList_h
#define DetectorPhysPhysicsList_h 1

#include "G4VUserPhysicsList.hh"
#include "globals.hh"

//----------------------------------------------------------------------

class DetectorPhysPhysicsList: public G4VUserPhysicsList {
  public:
    DetectorPhysPhysicsList();
    virtual ~DetectorPhysPhysicsList();

  protected:
    // Construct particle and physics
    void ConstructParticle();
    void ConstructProcess();

    void SetCuts();

  private:
//    G4int VerboseLevel;
//    G4int OpVerbLevel;
};

//----------------------------------------------------------------------

#endif
