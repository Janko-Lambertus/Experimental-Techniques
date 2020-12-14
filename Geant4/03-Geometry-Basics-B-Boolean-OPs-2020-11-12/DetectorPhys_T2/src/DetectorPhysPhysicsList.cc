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

#include "DetectorPhysPhysicsList.hh"
#include "G4ParticleTypes.hh"

//----------------------------------------------------------------------

DetectorPhysPhysicsList::DetectorPhysPhysicsList():  G4VUserPhysicsList() {
}

//----------------------------------------------------------------------

DetectorPhysPhysicsList::~DetectorPhysPhysicsList() {
}

//----------------------------------------------------------------------

void DetectorPhysPhysicsList::ConstructParticle() {
  G4Electron::ElectronDefinition();
}

//----------------------------------------------------------------------

void DetectorPhysPhysicsList::ConstructProcess() {
  AddTransportation();
}

//----------------------------------------------------------------------

void DetectorPhysPhysicsList::SetCuts() {
  G4int temp = GetVerboseLevel();                                                
  SetVerboseLevel(0);                                                           
  SetCutsWithDefault();   
  SetVerboseLevel(temp);  
}

//----------------------------------------------------------------------
