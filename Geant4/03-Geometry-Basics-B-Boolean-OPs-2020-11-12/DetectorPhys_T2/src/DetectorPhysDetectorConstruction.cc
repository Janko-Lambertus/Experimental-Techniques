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

#include "G4Box.hh"
#include "G4Tubs.hh"
#include "G4Orb.hh"
#include "G4LogicalVolume.hh"
#include "G4PVPlacement.hh"

#include "G4VisAttributes.hh"
#include "G4Colour.hh"
#include "G4ios.hh"

//***** Here maybe you include the proper .hh files for Boolean operations.

#include "G4RotationMatrix.hh"
#include "G4UnionSolid.hh"
#include "G4IntersectionSolid.hh"
#include "G4SubtractionSolid.hh"
//----------------------------------------------------------------------

DetectorPhysDetectorConstruction::DetectorPhysDetectorConstruction()
  : logicWorld(0), physiWorld(0) {
}

//----------------------------------------------------------------------

DetectorPhysDetectorConstruction::~DetectorPhysDetectorConstruction() {
}

//----------------------------------------------------------------------

G4VPhysicalVolume* DetectorPhysDetectorConstruction::Construct() {
  DefineMaterials();
  return ConstructSetUp();
}

//----------------------------------------------------------------------

void DetectorPhysDetectorConstruction::DefineMaterials() { 
  // This function illustrates the possible ways to define materials

  G4String name;
  G4double A, Z, density;
  G4double temperature, pressure;

  // Vacuum material
  name        = "Vacuum";
  density     = universe_mean_density;
  pressure    = 3.e-18*pascal;
  temperature = 2.73*kelvin;
  Z=1.;
  A=1.01*g/mole;
  Vacuum = new G4Material(name, Z, A, density, kStateGas, temperature, pressure);

  G4cout << *(G4Material::GetMaterialTable()) << G4endl;
}

//----------------------------------------------------------------------

G4VPhysicalVolume* DetectorPhysDetectorConstruction::ConstructSetUp() {
  //
  // World
  //
  G4double WorldSizeX = 3.*m;
  G4double WorldSizeY = 3.*m;
  G4double WorldSizeZ = 3.*m;

  G4Box* solidWorld = new G4Box("World",                                   // its name
                                WorldSizeX/2, WorldSizeY/2, WorldSizeZ/2); // its size

  logicWorld = new G4LogicalVolume(solidWorld, // its solid
                                   Vacuum,     // default material,
                                   "World");   // its name

  physiWorld = new G4PVPlacement(0,               // no rotation
                                 G4ThreeVector(), // at (0,0,0)
                                 "World",         // its name
                                 logicWorld,      // its logical volume
                                 0,               // its mother  volume
                                 false,           // not used
                                 0);              // copy number

  //#### PART A ####

  //#### Step 1: Solid Box
  //####   Construct a cube (Box) (name: "SolidBox") with the following lengths lx = ly = lz = 10 cm.
  //####   Don't forget to include the proper .hh file (discussed in the last tutorial).
  G4double ChamberGasBoxX = 10.*cm;
  G4double ChamberGasBoxY = 10.*cm;
  G4double ChamberGasBoxZ = 10.*cm;


  G4Box* SolidChamberGasBox = new G4Box("SolidChamberGasBox",                                  // its name
                                        ChamberGasBoxX/2, ChamberGasBoxY/2, ChamberGasBoxZ/2); // its size

  //G4LogicalVolume* LogicalChamberGasBox = new G4LogicalVolume(SolidChamberGasBox,      // its solid
    //                                                          Vacuum,                  // its material
    //                                                          "LogicalChamberGasBox"); // its name

  //G4VPhysicalVolume* PhysicalChamberGasBox = new G4PVPlacement(0,                       // no rotation
    //                                                           G4ThreeVector(0,0,0),    // at (0,0,0)
    //                                                           "PhysicalChamberGasBox", // its name
    //                                                           LogicalChamberGasBox,    // its logical volume
    //                                                           physiWorld,              // its mother  volume
    //                                                           false,                   // not used
    //                                                           0);                      // copy number

  //#### Step 2: Solid Cylinder
  //####   Construct a cylinder (Tubs) (name: "SolidCylinder") with the following parameters:
  //####   Rmin = 0 cm, Rmax = 5 cm, length Z = 20 cm, StartPhi = 0 deg, DeltaPhi = 360 deg
  //####   Don't forget to include the proper .hh file (discussed in the last tutorial).
  G4double Rmin      =   0.*cm;
  G4double Rmax      =   5.*cm;
  G4double Lc        =  10.*cm;
  G4double StartPhi1 =   0.*deg;
  G4double DeltaPhi1 = 360.*deg;

  G4Tubs* SolidChamberGasTube = new G4Tubs("SolidChamberGasTube",                                  // its name
                                        Rmin, Rmax, Lc/2, StartPhi1, DeltaPhi1); // its size

  //G4LogicalVolume* LogicalChamberGasTube = new G4LogicalVolume(SolidChamberGasTube,      // its solid
    //                                                          Vacuum,                  // its material
    //                                                          "LogicalChamberGasTube"); // its name

  //G4VPhysicalVolume* PhysicalChamberGasTube = new G4PVPlacement(0,                       // no rotation
    //                                                           G4ThreeVector(0,0,0),    // at (0,0,0)
    //                                                           "PhysicalChamberGasTube", // its name
    //                                                           LogicalChamberGasTube,    // its logical volume
    //                                                           physiWorld,              // its mother  volume
    //                                                           false,                   // not used
    //                                                           0);                      // copy number

  //#### Step 3: Solid Sphere
  //####   Construct a solid sphere (Orb) (name: "SolidSphere") with the following parameters:
  //####   Rmax = 5 cm,
  //####   Don't forget to include the proper .hh file (discussed in the last tutorial).
  G4double RSphere = 5.*cm;

  G4Orb* SolidChamberGasOrb = new G4Orb("SolidChamberGasOrb",                                  // its name
                                        RSphere); // its size

  G4LogicalVolume* LogicalChamberGasOrb = new G4LogicalVolume(SolidChamberGasOrb,      // its solid
                                                              Vacuum,                  // its material
                                                              "LogicalChamberGasOrb"); // its name

  //G4VPhysicalVolume* PhysicalChamberGasOrb = new G4PVPlacement(0,                       // no rotation
    //                                                           G4ThreeVector(0,0,-5.*cm),    // at (0,0,0)
    //                                                           "PhysicalChamberGasOrb", // its name
    //                                                           LogicalChamberGasOrb,    // its logical volume
    //                                                           physiWorld,              // its mother  volume
    //                                                           false,                   // not used
    //                                                           0);                      // copy number

  //#### Step 4: 3D transformations (it will be applid to solid 2 in the boolean operation)
  //####   Define a Rotation matrix where you rotate solid 2 around Y axis by 90° (in radian use M_PI/2).
  //####   Define a translation by a ThreeVector where translation is along the z axis by +5 cm.
  G4RotationMatrix* My3DRotation = new G4RotationMatrix;
  My3DRotation->rotateX(0);
  My3DRotation->rotateY(M_PI/2.*rad);
  My3DRotation->rotateZ(0);

  G4ThreeVector My3DTranslation(0,0,5.*cm);



  //#### Step 5: Union
  //####   Construct a new solid from an union of SolidBox and SolidCylinder where the 3D transformations (see step 4)
  //####   are applied to the cylinder.
  G4UnionSolid* BoxCylinderUnion = new G4UnionSolid("Box+Cylinder", 
						    SolidChamberGasBox,
						    SolidChamberGasTube,
						    My3DRotation,
						    My3DTranslation);
  
  //#### Step 6: Placement
  //####   Contruct a logical and a physical volume of the resulting volume with its center placed at (0,0,0)cm in the world volume.
  //####   Material: Vacuum as defined above
  G4LogicalVolume* LogicalBoxCylinderUnion = new G4LogicalVolume(BoxCylinderUnion,      // its solid
                                                              Vacuum,                  // its material
                                                              "LogicalBoxCylinderUnion"); // its name

  G4VPhysicalVolume* PhysicalBoxCylinderUnion = new G4PVPlacement(0,                       // no rotation
                                                               G4ThreeVector(0,0,0),    // at (0,0,0)
                                                               "PhysicalBoxCylinderUnion", // its name
                                                               LogicalBoxCylinderUnion,    // its logical volume
                                                               physiWorld,              // its mother  volume
                                                               false,                   // not used
                                                               0);                      // copy number
  
  //#### Step 7: Intersection
  //####   Construct a new solid from an intersection of SolidBox and SolidCylinder where the 3D transformations (see step 4)
  //####   are applied to the cylinder.
  G4IntersectionSolid* BoxCylinderIntersection = new G4IntersectionSolid("Box+Cylinder", 
						    SolidChamberGasBox,
						    SolidChamberGasTube,
						    My3DRotation,
						    My3DTranslation);  
  
  //#### Step 8: Placement
  //####   Contruct a logical and a physical volume of the resulting volume with its center placed at (0,0,20)cm in the world volume.
  //####   Material: Vacuum as defined above
  G4LogicalVolume* LogicalBoxCylinderIntersection = new G4LogicalVolume(BoxCylinderIntersection,      // its solid
                                                              Vacuum,                  // its material
                                                              "LogicalBoxCylinderIntersection"); // its name

  G4VPhysicalVolume* PhysicalBoxCylinderIntersection = new G4PVPlacement(0,                       // no rotation
                                                               G4ThreeVector(0,0,20.*cm),    // at (0,0,0)
                                                               "PhysicalBoxCylinderIntersection", // its name
                                                               LogicalBoxCylinderIntersection,    // its logical volume
                                                               physiWorld,              // its mother  volume
                                                               false,                   // not used
                                                               0);                      // copy number

  //#### Step 9: Subtraction
  //####   Construct a new solid from a subtraction of SolidBox and SolidCylinder where the 3D transformations (see step 4)
  //####   are applied to the cylinder.
  G4SubtractionSolid* BoxCylinderSubtraction = new G4SubtractionSolid("Box+Cylinder", 
						    SolidChamberGasBox,
						    SolidChamberGasTube,
						    My3DRotation,
						    My3DTranslation);  

  //#### Step 10: Placement
  //####   Contruct a logical and a physical volume of the resulting volume with its center placed at (0,0,40)cm in the world volume.
  //####   Material: Vacuum as defined above
  G4LogicalVolume* LogicalBoxCylinderSubtraction = new G4LogicalVolume(BoxCylinderSubtraction,      // its solid
                                                              Vacuum,                  // its material
                                                              "LogicalBoxCylinderSubtraction"); // its name

  G4VPhysicalVolume* PhysicalBoxCylinderSubtraction = new G4PVPlacement(0,                       // no rotation
                                                               G4ThreeVector(0,0,40.*cm),    // at (0,0,0)
                                                               "PhysicalBoxCylinderSubtraction", // its name
                                                               LogicalBoxCylinderSubtraction,    // its logical volume
                                                               physiWorld,              // its mother  volume
                                                               false,                   // not used
                                                               0);                      // copy number

  
  //#### PART B ####
  //####   Instead of using "world as a mother volume of the boolean volumes, contruct a new volume with name "container".
  //####   This container will be the new mother volume of the boolean geometry

  //#### Step 11: (new mother volume) Solid Box
  //####   Construct a cuboid (Box) (name: "container") with the following lengths lx = 20 cm, ly = 20 cm, lz = 120 cm
  
 
  //#### Step 12: Placement
  //####   Contruct a logical and a physical volume of "container" with its center placed at (-20,0,0)cm in the world volume.
  //####   Material: Vacuum as defined above


  //#### Back to boolean operations
  //#### Use now the solid sphere instead of the box

  //#### Step 13: Union
  //####   Construct a new solid from an union of SolidSphere and SolidCylinder where the 3D transformations (see step 4)
  //####   are applied to the cylinder.


  //#### Step 14: Placement
  //####   Contruct a logical and a physical volume of the resulting volume with its center placed at (0,0,-20)cm in the "container".
  //####   This time "container" is the mother volume of the resulting geometry.
  //####   Material: Vacuum as defined above


  //#### Step 15: Intersection
  //####   Construct a new solid from an intersection of SolidSphere and SolidCylinder where the 3D transformations (see step 4)
  //####   are applied to the cylinder.


  //#### Step 16: Placement
  //####   Contruct a logical and a physical volume of the resulting volume with its center placed at (0,0,0)cm in the "container".
  //####   This time "container" is the mother volume of the resulting geometry.
  //####   Material: Vacuum as defined above


  //#### Step 17: Subtraction
  //####  Construct a new solid from a subtraction of SolidSphere and SolidCylinder where the 3D transformations (see step 4)
  //####   are applied to the cylinder.


  //#### Step 18: Placement
  //####   Contruct a logical and a physical volume of the resulting volume with its center placed at (0,0,+20)cm in the "container".
  //####   This time "container" is the mother volume of the resulting geometry.
  //####   Material: Vacuum as defined above


  //#### Step 19: Repeated Placement
  //####   Repeat the placement (only the placement itself) of the container at (+20,0,0)cm (reminder: world is the mother volume of container).
  //####   Don't forget to increment the copy number argument.


  //#### Step 20: Colors
  //####  For better visualization try to attribute colors to your different volumes (see example below for the world)


  // Visualization attributes

  //G4VisAttributes* yellow = new G4VisAttributes( G4Colour(255/255., 255/255.,   0/255.) );
  //G4VisAttributes* red    = new G4VisAttributes( G4Colour(255/255.,   0/255.,   0/255.) );
  //G4VisAttributes* roux   = new G4VisAttributes( G4Colour(204/255.,   0/255.,  51/255.) );
  //G4VisAttributes* brown  = new G4VisAttributes( G4Colour(255/255., 153/255., 153/255.) );
  //G4VisAttributes* metal  = new G4VisAttributes( G4Colour(204/255., 204/255., 255/255.) );
  //G4VisAttributes* Lbleu  = new G4VisAttributes( G4Colour(  0/255., 204/255., 204/255.) );
  //G4VisAttributes* Lgreen = new G4VisAttributes( G4Colour(153/255., 255/255., 153/255.) );

  //logicWorld->SetVisAttributes(G4VisAttributes::Invisible); // hide the box of the World volume
  //logicWorld->SetVisAttributes(red);
  //LogicalChamberGasBox->SetVisAttributes(yellow);
  //LogicalChamberGasTube->SetVisAttributes(roux);
  //LogicalChamberGasOrb->SetVisAttributes(brown);
  return physiWorld;
}

//----------------------------------------------------------------------
