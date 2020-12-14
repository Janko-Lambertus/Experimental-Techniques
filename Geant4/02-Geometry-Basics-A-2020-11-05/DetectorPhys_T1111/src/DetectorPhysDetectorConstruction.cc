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

#include "DetectorPhysDetectorConstruction.hh"

#include "G4PhysicalConstants.hh"
#include "G4SystemOfUnits.hh"

#include "G4Material.hh"

#include "G4LogicalVolume.hh"
#include "G4PVPlacement.hh"

#include "G4VisAttributes.hh"
#include "G4Colour.hh"
#include "G4ios.hh"

//***** Here don't forget to incude basic geometry classes: example #include "G4Box.hh"
#include "G4Box.hh"
#include "G4Tubs.hh"
#include "G4Cons.hh"
#include "G4Sphere.hh"
#include "G4Orb.hh"
#include "G4Trd.hh"
//----------------------------------------------------------------------

DetectorPhysDetectorConstruction::DetectorPhysDetectorConstruction() {
}

//----------------------------------------------------------------------

DetectorPhysDetectorConstruction::~DetectorPhysDetectorConstruction() {
}

//----------------------------------------------------------------------

G4VPhysicalVolume* DetectorPhysDetectorConstruction::Construct() {
  DefineMaterials();
  return ConstructSetUp();
}

void DetectorPhysDetectorConstruction::DefineMaterials() { 
  // This function illustrates the possible ways to define materials

  G4String name;
  G4double A, Z, density;
  G4double temperature, pressure;
  G4int ncomponents, natoms;

  G4Element* H  = new G4Element("Hydrogen",name="H" , Z= 1., A=  1.01*g/mole);
  G4Element* O  = new G4Element("Oxygen"  ,name="O" , Z= 8., A= 16.00*g/mole);

  // Vacuum material
  name        = "Vacuum";
  density     = universe_mean_density;
  pressure    = 3.e-18*pascal;
  temperature = 2.73*kelvin;
  Z=1.;
  A=1.01*g/mole;
  Vacuum = new G4Material(name, Z, A , density, kStateGas,temperature,pressure);

  H2O =  new G4Material("Water", density= 1.000*g/cm3, ncomponents=2);
  H2O->AddElement(H, natoms=2);
  H2O->AddElement(O, natoms=1);

  G4cout << *(G4Material::GetMaterialTable()) << G4endl;
}

//----------------------------------------------------------------------

G4VPhysicalVolume* DetectorPhysDetectorConstruction::ConstructSetUp() {
  //
  // World
  //
  G4double WorldSizeX = 1.*m;
  G4double WorldSizeY = 1.*m;
  G4double WorldSizeZ = 1.*m;

  G4Box* solidWorld = new G4Box("World",                                   // its name
                                WorldSizeX/2, WorldSizeY/2, WorldSizeZ/2); // its size

  G4LogicalVolume* logicWorld = new G4LogicalVolume(solidWorld, // its solid
                                                    Vacuum,     // defaultMaterial,
                                                    "World");   // its name

  G4VPhysicalVolume* physiWorld = new G4PVPlacement(0,               // no rotation
                                                    G4ThreeVector(), // at (0,0,0)
                                                    "World",         // its name
                                                    logicWorld,      // its logical volume
                                                    0,               // its mother  volume
                                                    false,           // not used
                                                    0);              // copy number

  //
  // Chamber Gas Box
  //
  //####
  //#### Task A: Implement a Box at (0,0,0) (Do not forget to include the "G4Box.hh")
  //####

  G4double ChamberGasBoxX = 10.*cm;
  G4double ChamberGasBoxY = 10.*cm;
  G4double ChamberGasBoxZ = 10.*cm;

//  G4Box* a_box = new G4Box("World",                                   // its name
//                                ChamberGasBoxX/2, ChamberGasBoxY/2, ChamberGasBoxZ/2); // its size

//  G4LogicalVolume* a_box_log = new G4LogicalVolume(a_box, // its solid
//                                                    Vacuum,     // defaultMaterial,
//                                                    "a simple box");   // its name

//  G4VPhysicalVolume* a_box_phys = new G4PVPlacement(0,               // no rotation
//                                                    G4ThreeVector(-20.*cm,0,0), // at (0,0,0)
//                                                    "a box",         // its name
//                                                    a_box_log,      // its logical volume
//                                                    physiWorld,               // its mother  volume
//                                                    false,           // not used
//                                                    1);              // copy number

  //#### Task A-1: Once you are done, compile your c++ code (using "make")
  //#### Task A-2: Then execute if it compiles. The executable is in the current directory (To execute use simply: ./DetectorPhys_T1)
  //#### Task A-3: Check whether your geometry is OK using the command "/geometry/test/run"!

  G4Box* SolidChamberGasBox = new G4Box("SolidChamberGasBox",                                  // its name
                                        ChamberGasBoxX/2, ChamberGasBoxY/2, ChamberGasBoxZ/2); // its size

  G4LogicalVolume* LogicalChamberGasBox = new G4LogicalVolume(SolidChamberGasBox,      // its solid
                                                              Vacuum,                  // its material
                                                              "LogicalChamberGasBox"); // its name

  G4VPhysicalVolume* PhysicalChamberGasBox = new G4PVPlacement(0,                       // no rotation
                                                               G4ThreeVector(0,0,-45.*cm),    // at (0,0,0)
                                                               "PhysicalChamberGasBox", // its name
                                                               LogicalChamberGasBox,    // its logical volume
                                                               physiWorld,              // its mother  volume
                                                               false,                   // not used
                                                               0);                      // copy number

  //####
  //#### Task B: Implement a Cylinder (or Tube) (Do not forget to include the right ".hh" file. You can have a look into the documentation.)
  //####         Make sure that this volume is adjacent to the previous volume as shown in the figure (see fig in the exercise of the tutorial)

  G4double Rmin      =   0.*cm;
  G4double Rmax      =   5.*cm;
  G4double Lc        =  10.*cm;
  G4double StartPhi1 =   0.*deg;
  G4double DeltaPhi1 = 360.*deg;

  G4Tubs* SolidChamberGasTube = new G4Tubs("SolidChamberGasTube",                                  // its name
                                        Rmin, Rmax, Lc/2, StartPhi1, DeltaPhi1); // its size

  G4LogicalVolume* LogicalChamberGasTube = new G4LogicalVolume(SolidChamberGasTube,      // its solid
                                                              Vacuum,                  // its material
                                                              "LogicalChamberGasTube"); // its name

  G4VPhysicalVolume* PhysicalChamberGasTube = new G4PVPlacement(0,                       // no rotation
                                                               G4ThreeVector(0,0,-35.*cm),    // at (0,0,0)
                                                               "PhysicalChamberGasTube", // its name
                                                               LogicalChamberGasTube,    // its logical volume
                                                               physiWorld,              // its mother  volume
                                                               false,                   // not used
                                                               0);                      // copy number
  //#### Task B-1: Once you are done, compile your c++ code (using "make")
  //#### Task B-2: Then execute if it compiles. The executable is in the current directory (To execute use simply: ./DetectorPhys_T1)
  //#### Task B-3: Check whether your geometry is OK using the command "/geometry/test/run"!


  //####
  //#### Task C: Implement a Cone (Do not forget to include the right ".hh" file. You can have a look into the documentation.)
  //####         Make sure that this volume is adjacent to the previous volume as shown in the figure (see fig in the exercise of the tutorial)

  G4double Rmin1     =   0. *cm;  // at -L
  G4double Rmax1     =   5. *cm;  // at -L
  G4double Rmin2     =   0. *cm;  // at +L
  G4double Rmax2     =   2.5*cm;  // at +L
  G4double L         =  10. *cm;
  G4double StartPhi2 =   0.*deg;
  G4double DeltaPhi2 = 360.*deg;

  G4Cons* SolidChamberGasCons = new G4Cons("SolidChamberGasCons",                                  // its name
                                        Rmin1, Rmax1, Rmin2, Rmax2, L/2, StartPhi2, DeltaPhi2); // its size

  G4LogicalVolume* LogicalChamberGasCons = new G4LogicalVolume(SolidChamberGasCons,      // its solid
                                                              Vacuum,                  // its material
                                                              "LogicalChamberGasCons"); // its name

  G4VPhysicalVolume* PhysicalChamberGasCons = new G4PVPlacement(0,                       // no rotation
                                                               G4ThreeVector(0,0,-25.*cm),    // at (0,0,0)
                                                               "PhysicalChamberGasCons", // its name
                                                               LogicalChamberGasCons,    // its logical volume
                                                               physiWorld,              // its mother  volume
                                                               false,                   // not used
                                                               0);                      // copy number

  //#### Task C-1: Once you are done, compile your c++ code (using "make")
  //#### Task C-2: Then execute if it compiles. The executable is in the current directory (To execute use simply: ./DetectorPhys_T1)
  //#### Task C-3: Check whether your geometry is OK using the command "/geometry/test/run"!


  //####
  //#### Task D: Implement a Sphere (Do not forget to include the right ".hh" file. You can have a look into the documentation.)
  //####         Make sure that this volume is adjacent to the previous volume as shown in the figure (see fig in the exercise of the tutorial)

  G4double Rmin_s       =   0.*cm;
  G4double Rmax_s       =   5.*cm;
  G4double StartPhi_s   =   0.*deg;
  G4double DeltaPhi_s   = 360.*deg;
  G4double StartTheta_s =   0.*deg;
  G4double DeltaTheta_s = 180.*deg;



  G4Sphere* SolidChamberGasSphere = new G4Sphere("SolidChamberGasSphere",                                  // its name
                                        Rmin_s, Rmax_s, StartPhi_s, DeltaPhi_s, StartTheta_s, DeltaTheta_s); // its size

  G4LogicalVolume* LogicalChamberGasSphere = new G4LogicalVolume(SolidChamberGasSphere,      // its solid
                                                              Vacuum,                  // its material
                                                              "LogicalChamberGasSphere"); // its name

  G4VPhysicalVolume* PhysicalChamberGasSphere = new G4PVPlacement(0,                       // no rotation
                                                               G4ThreeVector(0,0,-15.*cm),    // at (0,0,0)
                                                               "PhysicalChamberGasSphere", // its name
                                                               LogicalChamberGasSphere,    // its logical volume
                                                               physiWorld,              // its mother  volume
                                                               false,                   // not used
                                                               0);                      // copy number
  //#### Task D-1: Once you are done, compile your c++ code (using "make")
  //#### Task D-2: Then execute if it compiles. The executable is in the current directory (To execute use simply: ./DetectorPhys_T1)
  //#### Task D-3: Check whether your geometry is OK using the command "/geometry/test/run"!


  //####
  //#### Task E: Implement a Full Solid Sphere (Do not forget to include the right ".hh" file. You can have a look into the documentation.)
  //####         Make sure that this volume is adjacent to the previous volume as shown in the figure (see fig in the exercise of the tutorial)

  G4double RSphere = 5.*cm;

  G4Orb* SolidChamberGasOrb = new G4Orb("SolidChamberGasOrb",                                  // its name
                                        RSphere); // its size

  G4LogicalVolume* LogicalChamberGasOrb = new G4LogicalVolume(SolidChamberGasOrb,      // its solid
                                                              Vacuum,                  // its material
                                                              "LogicalChamberGasOrb"); // its name

  G4VPhysicalVolume* PhysicalChamberGasOrb = new G4PVPlacement(0,                       // no rotation
                                                               G4ThreeVector(0,0,-5.*cm),    // at (0,0,0)
                                                               "PhysicalChamberGasOrb", // its name
                                                               LogicalChamberGasOrb,    // its logical volume
                                                               physiWorld,              // its mother  volume
                                                               false,                   // not used
                                                               0);                      // copy number

  //#### Task E-1: Once you are done, compile your c++ code (using "make")
  //#### Task E-2: Then execute if it compiles. The executable is in the current directory (To execute use simply: ./DetectorPhys_T1)
  //#### Task E-3: Check whether your geometry is OK using the command "/geometry/test/run"!


  //####
  //#### Task F: Implement a Trapezoid (Do not forget to include the right ".hh" file. You can have a look into the documentation.)
  //####         Make sure that this volume is adjacent to the previous volume as shown in the figure (see fig in the exercise of the tutorial)

  G4double dx1 = 10. *cm;
  G4double dx2 =  2.5*cm;
  G4double dy1 = 10. *cm;
  G4double dy2 =  2.5*cm;
  G4double dz  = 10. *cm;

  G4Trd* SolidChamberGasTrd = new G4Trd("SolidChamberGasTrd",                                  // its name
                                        dx1, dx2, dy1, dy2, dz/2); // its size

  G4LogicalVolume* LogicalChamberGasTrd = new G4LogicalVolume(SolidChamberGasTrd,      // its solid
                                                              Vacuum,                  // its material
                                                              "LogicalChamberGasTrd"); // its name

  G4VPhysicalVolume* PhysicalChamberGasTrd = new G4PVPlacement(0,                       // no rotation
                                                               G4ThreeVector(0,0,5.*cm),    // at (0,0,0)
                                                               "PhysicalChamberGasTrd", // its name
                                                               LogicalChamberGasTrd,    // its logical volume
                                                               physiWorld,              // its mother  volume
                                                               false,                   // not used
                                                               0);                      // copy number

  //#### Task F-1: Once you are done, compile your c++ code (using "make")
  //#### Task F-2: Then execute if it compiles. The executable is in the current directory (To execute use simply: ./DetectorPhys_T1)
  //#### Task F-3: Check whether your geometry is OK using the command "/geometry/test/run"!


  // Visualization attributes

  logicWorld->SetVisAttributes (G4VisAttributes::Invisible); // hide the box of the World volume

  G4VisAttributes* yellow = new G4VisAttributes( G4Colour(255/255., 255/255.,   0/255.) );
  G4VisAttributes* red    = new G4VisAttributes( G4Colour(255/255.,   0/255.,   0/255.) );
  G4VisAttributes* roux   = new G4VisAttributes( G4Colour(204/255.,   0/255.,  51/255.) );
  G4VisAttributes* brown  = new G4VisAttributes( G4Colour(255/255., 153/255., 153/255.) );
  G4VisAttributes* metal  = new G4VisAttributes( G4Colour(204/255., 204/255., 255/255.) );
  G4VisAttributes* Lbleu  = new G4VisAttributes( G4Colour(  0/255., 204/255., 204/255.) );
  G4VisAttributes* Lgreen = new G4VisAttributes( G4Colour(153/255., 255/255., 153/255.) );

  //####
  //#### Task G: Visualize your geometry using different colors (defined above).(see example below)
  //####

  //#### Task G-1: Once you are done, compile your c++ code (using "make")
  //#### Task G-2: Then execute if it compiles. The executable is in the current directory (To execute use simply: ./DetectorPhys_T1)

  LogicalChamberGasBox->SetVisAttributes(yellow);
  LogicalChamberGasTube->SetVisAttributes(red);
  LogicalChamberGasCons->SetVisAttributes(brown);
  LogicalChamberGasSphere->SetVisAttributes(Lbleu);
  LogicalChamberGasOrb->SetVisAttributes(Lgreen);
  LogicalChamberGasTrd->SetVisAttributes(metal);


  return physiWorld;
}

//----------------------------------------------------------------------
