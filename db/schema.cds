using { cuid, managed, sap.common.CodeList } from '@sap/cds/common';
using {Attachments} from '@cap-js/attachments';

namespace asbestos.management;

entity SiteWithSearchCriteria : cuid, managed {
accessibility : String; // Accessibility
activityAndMovement : String; // Activity and Movement
airPlenum : Boolean; // Air Plenum
analysedDate : DateTime; // Analysed Date
analysisType : String; // Analysis Type
application : String; // Application
areaInSqMeters : Decimal(10,2); // Area in M²
areasNotAccessed : String; // Areas Not Accessed
AsbestosSurvey: Composition of many AsbestosSurvey;
assessmentDate : DateTime; // Assessment Date
assetID : String; // Asset ID
assetOwner : String; // Asset Owner
attachments : Composition of many Attachments; // Attachments without ON condition
buildingDescription : String; // Building Description
buildingNumber : String; // Building Number
changedBy : String; // Changed By
changedOn : DateTime; // Changed On
city : String; // City
comments : String; // Comments
condition : String; // Condition
country : String; // Country
createdBy : String; // Created By
createdOn : DateTime; // Created On
custodianFirstName : String; // Custodian First Name
custodianLastName : String; // Custodian Last Name
descriptionOrientation : String; // Description/Orientation
directorate : String; // Directorate
equipment : String; // Equipment
equipmentDescription : String; // Equipment Description
exposedSurfaceArea : Decimal(10,2); // Exposed Surface Area
fiberType : String; // Fiber Type
floorLevel : String; // Floor Level
foyerSignage : Boolean; // Foyer Signage
friability : String; // Friability
functionalLocationDesc : String; // Functional Location Description
    functionalLocationNo : String; // Functional Location No
homeNo : String; // Home No
locationDescription : String; // Location Description
lotOnPlan : String; // Lot on Plan
materialCheckbox : Boolean; // Material Checkbox
materialProduct : String; // Material / Product
materialSignage : Boolean; // Material Signage
noFloorsLevels : Integer; // No Floors Levels
noOfOldSurveys : Integer default 1; // No of Old Survey Per Fl/EQ (Value Defaulted to 1)
noSealed : Boolean; // No Sealed
owner : String; // Owner
pbCode : String; // PB Code
productMaterial : String; // Product / Material
quantity : Decimal(10,2); // Quantity
recommendedControl : String; // Recommended Control
recommendedControlMeasures: String; // Recommended Control Measures
reinspectionDue : DateTime; // Reinspection Due
removalCosts : Decimal(10,2); // Removal Costs
riskRating : Integer; // Risk Rating
roomNoOrName : String; // Room No. / Name
sampleAnalysisDate : DateTime; // Sample Analysis Date
sampleNo : String; // Sample No
signageRequired : Boolean; // Signage Required
siteDescription : String; // Site Description
siteType : String; // Site Type
siteUserStatus : String; // Site User Status
state : String; // State
street : String; // Street
suburb : String; // Suburb
surveyedBy : String; // Surveyed By
surveyNumber : String; // Survey Number
surveyStatus : String; // Survey Status
unit : String; // Unit
usage : String; // Usage
waterDamage : Boolean; // Water Damage
yearBuilt : Integer; // Year Built
zipCode : String; // Zip Code
}


/*
entity SiteWithSearchCriteria : cuid, managed {
    // Site-specific fields
    siteDescription        : String; // Site Description
    siteType               : String; // Site Type
    siteUserStatus         : String; // Site User Status
    city                   : String; // City
    state                  : String; // State
    zipCode                : String; // Zip Code
    country                : String; // Country
    areaInSqMeters         : Decimal(10, 2); // Area in M²
    assetID                : String; // Asset ID
    custodianFirstName     : String; // Custodian First Name
    custodianLastName      : String; // Custodian Last Name
    yearBuilt              : Integer; // Year Built
    lotOnPlan              : String; // Lot on Plan
    noFloorsLevels         : Integer; // No Floors Levels
    usage                  : String; // Usage
    descriptionOrientation : String; // Description/Orientation
    directorate            : String; // Directorate
    owner                  : String; // Owner
    homeNo                 : String; // Home No
    street                 : String; // Street

    // New fields (Functional Location and Survey details)
    functionalLocationNo   : String; // Functional Location No
    functionalLocationDesc : String; // Functional Location Description
    equipment              : String; // Equipment
    equipmentDescription   : String; // Equipment Description
    surveyNumber           : String; // Survey Number
    surveyStatus           : String; // Survey Status
    analysedDate           : DateTime; // Analysed Date

    // SearchCriteria-related fields
    accessibility          : String; // Accessibility
    airPlenum              : Boolean; // Air Plenum
    analysisType           : String; // Analysis Type
    application            : String; // Application
    assetOwner             : String; // Asset Owner
    changedBy              : String; // Changed By
    changedOn              : DateTime; // Changed On
    condition              : String; // Condition
    createdBy              : String; // Created By
    createdOn              : DateTime; // Created On
    exposedSurfaceArea     : Decimal(10, 2); // Exposed Surface Area
    fiberType              : String; // Fiber Type
    foyerSignage           : Boolean; // Foyer Signage
    friability             : String; // Friability
    materialProduct        : String; // Material / Product
    materialSignage        : Boolean; // Material Signage
    noOfOldSurveys         : Integer default 1; // No of Old Survey Per Fl/EQ (Value Defaulted to 1)
    recommendedControl     : String; // Recommended Control
    reinspectionDue        : DateTime; // Reinspection Due
    riskRating             : Integer; // Risk Rating
    suburb                 : String; // Suburb
    surveyedBy             : String; // Surveyed By
    waterDamage            : Boolean; // Water Damage
    // Corrected Attachments composition
    attachments            : Composition of many Attachments; // Attachments without ON condition
    AsbestosSurvey         : Composition of many AsbestosSurvey
}
*/

/**
 * Site entity representing details of each site.
 */
entity Site : cuid, managed {  // `cuid` generates a unique key (UUID) and `managed` adds auto fields (createdBy, createdOn, etc.)
    siteDescription        : String;           // Site Description
    siteType               : String;           // Site Type
    siteUserStatus         : String;           // Site User Status
    city                   : String;           // City
    state                  : String;           // State
    zipCode                : String;           // Zip Code
    country                : String;           // Country
    areaInSqMeters         : Decimal(10,2);    // Area in M²
    assetID                : String;           // Asset ID
    custodianFirstName     : String;           // Custodian First Name
    custodianLastName      : String;           // Custodian Last Name
    yearBuilt              : Integer;          // Year Built
    lotOnPlan              : String;           // Lot on Plan
    noFloorsLevels         : Integer;          // No Floors Levels
    usage                  : String;           // Usage
    descriptionOrientation : String;           // Description/Orientation
    directorate            : String;           // Directorate
    owner                  : String;           // Owner
    homeNo                 : String;           // Home No
    street                 : String;           // Street
    // New fields added 
    functionalLocationNo        : String;        // Functional Location No
    functionalLocationDesc      : String;        // Functional Location Description
    equipment                  : String;        // Equipment
    equipmentDescription       : String;        // Equipment Description
    surveyNumber               : String;        // Survey Number
    surveyStatus               : String;        // Survey Status
    analysedDate               : DateTime;      // Analysed Date

}

/**
 * Asbestos Survey entity.
 */
entity AsbestosSurvey : cuid, managed {
    accessibility             : String;            // Accessibility
    activityAndMovement       : String;            // Activity and Movement
    airPlenum                 : Boolean;           // Air Plenum
    analysisType              : String;            // Analysis Type
    application               : String;            // Application
    areasNotAccessed          : String;            // Areas Not Accessed
    assessmentDate            : DateTime;          // Assessment Date
    buildingDescription       : String;            // Building Description
    buildingNumber            : String;            // Building Number
    comments                  : String;            // Comments
    condition                 : String;            // Condition
    exposedSurfaceArea        : Decimal(10,2);     // Exposed Surface Area
    fiberType                 : String;            // Fiber Type
    floorLevel                : String;            // Floor Level
    foyerSignage              : Boolean;           // Foyer Signage
    friability                : String;            // Friability
    locationDescription       : String;            // Location Description
    materialCheckbox          : Boolean;           // Material Checkbox
    materialSignage           : Boolean;           // Material Signage
    noSealed                  : Boolean;           // No Sealed
    pbCode                    : String;            // PB Code
    productMaterial           : String;            // Product / Material
    quantity                  : Decimal(10,2);     // Quantity
    recommendedControlMeasures: String;            // Recommended Control Measures
    reinspectionDue           : DateTime;          // Reinspection Due
    removalCosts              : Decimal(10,2);     // Removal Costs
    riskRating                : Integer;           // Risk Rating
    roomNoOrName              : String;            // Room No. / Name
    sampleAnalysisDate        : DateTime;          // Sample Analysis Date
    sampleNo                  : String;            // Sample No
    signageRequired           : Boolean;           // Signage Required
    surveyStatus              : Association to SurveyStatus; // Use association to `SurveyStatus` entity
    surveyedBy                : String;            // Surveyed By
    unit                      : String;            // Unit
    waterDamage               : Boolean;           // Water Damage
}

/**
 * Search Criteria entity for searching asbestos surveys.
 */
entity SearchCriteria : cuid, managed {
    accessibility             : String;                // Accessibility
    airPlenum                 : Boolean;               // Air Plenum
    analysisType              : String;                // Analysis Type
    application               : String;                // Application
    assetOwner                : String;                // Asset Owner
    changedBy                 : String;                // Changed By
    changedOn                 : DateTime;              // Changed On
    condition                 : String;                // Condition
    createdBy                 : String;                // Created By
    createdOn                 : DateTime;              // Created On
    description               : String;                // Description
    directorate               : String;                // Directorate
    equipment                 : String;                // Equipment (updated from equipmentNo)
    exposedSurfaceArea        : Decimal(10,2);         // Exposed Surface Area
    fiberType                 : String;                // Fiber Type
    foyerSignage              : Boolean;               // Foyer Signage
    friability                : String;                // Friability
    functionalLocation        : String;                // Functional Location
    materialProduct           : String;                // Material / Product
    materialSignage           : Boolean;               // Material Signage
    noOfOldSurveys            : Integer default 1;     // No of Old Survey Per Fl/EQ (Value Defaulted to 1)
    recommendedControl        : String;                // Recommended Control
    reinspectionDue           : DateTime;              // Reinspection Due
    riskRating                : Integer;               // Risk Rating
    suburb                    : String;                // Suburb
    surveyNumber              : String;                // Survey Number
    surveyStatus              : Association to SurveyStatus; // Survey Status (associated with `SurveyStatus` entity)
    surveyedBy                : String;                // Surveyed By
    waterDamage               : Boolean;               // Water Damage
}


/**
 * Survey Status entity (using CodeList for enum-like functionality).
 */
entity SurveyStatus : CodeList {
    key code : String enum {
        new = 'N';
        assigned = 'A';
        in_process = 'I';
        on_hold = 'H';
        resolved = 'R';
        closed = 'C';
    };
    description : String;
}

/**
 * Functional Location entity (using CodeList for dropdown functionality).
 */
entity FunctionalLocation : CodeList {
    key code : String enum {
        fl001 = 'FL-001';
        fl002 = 'FL-002';
        fl003 = 'FL-003';
    };
    description : String;
}

/**
 * Equipment entity (using CodeList for dropdown functionality).
 */
entity Equipment : CodeList {
    key code : String enum {
        eq001 = 'EQ-001';
        eq002 = 'EQ-002';
        eq003 = 'EQ-003';
    };
    description : String;
}


