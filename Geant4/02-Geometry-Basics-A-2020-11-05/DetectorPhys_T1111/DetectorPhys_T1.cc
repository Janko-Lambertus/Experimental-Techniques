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

#include "G4RunManager.hh"
#include "G4UImanager.hh"
#include "G4UIterminal.hh"
#include "G4UItcsh.hh"

#include "G4VisExecutive.hh"

#include "G4UIExecutive.hh"

#include "DetectorPhysDetectorConstruction.hh"
#include "DetectorPhysPhysicsList.hh"
#include "DetectorPhysPrimaryGeneratorAction.hh"

//----------------------------------------------------------------------

int main(int argc,char** argv) {

  // Choose the Random engine
  //
  G4Random::setTheEngine(new CLHEP::MTwistEngine);
  
  // Construct the default run manager
  G4RunManager* runManager = new G4RunManager;

  // set mandatory initialization classes
  auto detector = new DetectorPhysDetectorConstruction;
  runManager->SetUserInitialization(detector);

  auto the_physics = new DetectorPhysPhysicsList;
  runManager->SetUserInitialization(the_physics);

  auto primarygeneration = new DetectorPhysPrimaryGeneratorAction(detector);
  runManager->SetUserAction(primarygeneration);

  //Initialize G4 kernel
  runManager->Initialize();

  // visualization manager
  auto visManager = new G4VisExecutive;
  visManager->Initialize();

  // get the pointer to the User Interface manager
  auto UI = G4UImanager::GetUIpointer();

  if (UI) { // Define UI session for interactive mode
    G4UIExecutive* UI2 = new G4UIExecutive(argc, argv);
    UI->ApplyCommand("/control/execute vis_T1.mac");
    UI2->SessionStart();
    delete UI2;
  } else {  // Batch mode
    G4String command  = "/control/execute ";
    G4String fileName = argv[1];
    UI->ApplyCommand(command+fileName);
  }

  delete visManager;
  delete runManager;

  return 0;
}

//----------------------------------------------------------------------
