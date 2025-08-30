using AsbestosService as service from '../../srv/services';
annotate service.SiteWithSearchCriteria with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'Site Details',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Asbestos Surveys',
            ID : 'AsbestosSurveysTable',
            Target : 'AsbestosSurvey/@UI.LineItem',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : functionalLocationNo,
            Label : 'Functional Location No',
        },
        {
            $Type : 'UI.DataField',
            Value : equipment,
            Label : 'Equipment',
        },
        {
            $Type : 'UI.DataField',
            Value : surveyNumber,
            Label : 'Survey Number',
        },
        {
            $Type : 'UI.DataField',
            Value : surveyStatus,
            Label : 'Survey Status',
            Criticality : noOfOldSurveys,
        },
                    {
                $Type : 'UI.DataField',
                Value : functionalLocationDesc,
                Label : 'Functional Location Description',
            },
            {
                $Type : 'UI.DataField',
                Value : functionalLocationLatitude,
                Label : 'Functional Location Latitude',
            },
            {
                $Type : 'UI.DataField',
                Value : functionalLocationLongitude,
                Label : 'Functional Location Longitude',
            },
            {
                $Type : 'UI.DataField',
                Value : equipmentDescription,
                Label : 'Equipment Description',
            },
            {
                $Type : 'UI.DataField',
                Value : analysedDate,
                Label : 'Analysed Date',
            },
    ],
    UI.SelectionFields : [
        functionalLocationNo,
        equipment,
        suburb,
        descriptionOrientation,
        noOfOldSurveys,
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : ID,
        },
        TypeName : 'Site',
        TypeNamePlural : 'Sites',
        Description : {
            $Type : 'UI.DataField',
            Value : siteDescription,
        },
    },
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
                Label : 'ID',
            },
            {
                $Type : 'UI.DataField',
                Value : functionalLocationNo,
                Label : 'Functional Location No',
            },
            {
                $Type : 'UI.DataField',
                Value : equipment,
                Label : 'Equipment',
            },
            {
                $Type : 'UI.DataField',
                Value : surveyNumber,
                Label : 'Survey Number',
            },
            {
                $Type : 'UI.DataField',
                Value : surveyStatus,
                Label : 'Survey Status',
            },
            {
                $Type : 'UI.DataField',
                Value : functionalLocationDesc,
                Label : 'Functional Location Description',
            },
            {
                $Type : 'UI.DataField',
                Value : functionalLocationLatitude,
                Label : 'Functional Location Latitude',
            },
            {
                $Type : 'UI.DataField',
                Value : functionalLocationLongitude,
                Label : 'Functional Location Longitude',
            },
            {
                $Type : 'UI.DataField',
                Value : equipmentDescription,
                Label : 'Equipment Description',
            },
            {
                $Type : 'UI.DataField',
                Value : analysedDate,
                Label : 'Analysed Date',
            },
            {
                $Type : 'UI.DataField',
                Value : siteDescription,
                Label : 'Site Description',
            },
            {
                $Type : 'UI.DataField',
                Value : suburb,
                Label : 'Suburb',
            },
            {
                $Type : 'UI.DataField',
                Value : descriptionOrientation,
                Label : 'Description Orientation',
            },
            {
                $Type : 'UI.DataField',
                Value : noOfOldSurveys,
                Label : 'No of Old Surveys',
            },
        ],
    },
);

annotate service.SiteWithSearchCriteria with {
    functionalLocationNo @Common.Label : '{i18n>FunctionalLocationNo}'
};

annotate service.SiteWithSearchCriteria with {
    functionalLocationNo @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'FunctionalLocation',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterOut',
                    LocalDataProperty : functionalLocationNo,
                    ValueListProperty : 'code'
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description'
                }
            ]
        }
    )
};

annotate service.SiteWithSearchCriteria with {
    equipment @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Equipment',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterOut',
                    LocalDataProperty : equipment,
                    ValueListProperty : 'code'
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description'
                }
            ]
        }
    )
};



annotate service.SiteWithSearchCriteria with {
    equipment @Common.Label : '{i18n>Equipment1}'
};

annotate service.SiteWithSearchCriteria with {
    suburb @Common.Label : '{i18n>Suburb}'
};

annotate service.SiteWithSearchCriteria with {
    descriptionOrientation @Common.Label : '{i18n>DescriptionOrientation}'
};

annotate service.SiteWithSearchCriteria with {
    noOfOldSurveys @Common.Label : '{i18n>NoOfOldSurveys}'
};

annotate service.SiteWithSearchCriteria with {
    createdBy @Common.Text : analysisType
};

annotate service.SiteWithSearchCriteria with {
    siteDescription @Common.Text : siteType
};

annotate service.SiteWithSearchCriteria with {
    city @(
        Common.Text : country,
        UI.MultiLineText : true,
        Common.FieldControl : #Optional,
    )
};

annotate service.AsbestosSurvey with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : surveyNumber,
            Label : 'Survey Number',
        },
        {
            $Type : 'UI.DataField',
            Value : surveyStatus,
            Label : 'Survey Status',
        },
        {
            $Type : 'UI.DataField',
            Value : analysedDate,
            Label : 'Analysed Date',
        },
        {
            $Type : 'UI.DataField',
            Value : surveyedBy,
            Label : 'Surveyed By',
        },
        {
            $Type : 'UI.DataField',
            Value : riskRating,
            Label : 'Risk Rating',
        },
        {
            $Type : 'UI.DataField',
            Value : condition,
            Label : 'Condition',
        },
        {
            $Type : 'UI.DataField',
            Value : recommendedControl,
            Label : 'Recommended Control',
        },
        {
            $Type : 'UI.DataField',
            Value : buildingDescription,
            Label : 'Building Description',
        },
        {
            $Type : 'UI.DataField',
            Value : locationDescription,
            Label : 'Location Description',
        },
        {
            $Type : 'UI.DataField',
            Value : surveyLatitude,
            Label : 'Survey Latitude',
        },
        {
            $Type : 'UI.DataField',
            Value : surveyLongitude,
            Label : 'Survey Longitude',
        },
    ],
    UI.FieldGroup #AsbestosSurveyGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : surveyNumber,
                Label : 'Survey Number',
            },
            {
                $Type : 'UI.DataField',
                Value : surveyStatus,
                Label : 'Survey Status',
            },
            {
                $Type : 'UI.DataField',
                Value : analysedDate,
                Label : 'Analysed Date',
            },
            {
                $Type : 'UI.DataField',
                Value : surveyedBy,
                Label : 'Surveyed By',
            },
            {
                $Type : 'UI.DataField',
                Value : riskRating,
                Label : 'Risk Rating',
            },
            {
                $Type : 'UI.DataField',
                Value : condition,
                Label : 'Condition',
            },
            {
                $Type : 'UI.DataField',
                Value : recommendedControl,
                Label : 'Recommended Control',
            },
            {
                $Type : 'UI.DataField',
                Value : buildingDescription,
                Label : 'Building Description',
            },
            {
                $Type : 'UI.DataField',
                Value : locationDescription,
                Label : 'Location Description',
            },
            {
                $Type : 'UI.DataField',
                Value : surveyLatitude,
                Label : 'Survey Latitude',
            },
            {
                $Type : 'UI.DataField',
                Value : surveyLongitude,
                Label : 'Survey Longitude',
            },
            {
                $Type : 'UI.DataField',
                Value : application,
                Label : 'Application',
            },
            {
                $Type : 'UI.DataField',
                Value : accessibility,
                Label : 'Accessibility',
            },
            {
                $Type : 'UI.DataField',
                Value : airPlenum,
                Label : 'Air Plenum',
            },
            {
                $Type : 'UI.DataField',
                Value : analysisType,
                Label : 'Analysis Type',
            },
            {
                $Type : 'UI.DataField',
                Value : exposedSurfaceArea,
                Label : 'Exposed Surface Area',
            },
            {
                $Type : 'UI.DataField',
                Value : fiberType,
                Label : 'Fiber Type',
            },
            {
                $Type : 'UI.DataField',
                Value : friability,
                Label : 'Friability',
            },
            {
                $Type : 'UI.DataField',
                Value : materialProduct,
                Label : 'Material Product',
            },
            {
                $Type : 'UI.DataField',
                Value : quantity,
                Label : 'Quantity',
            },
            {
                $Type : 'UI.DataField',
                Value : reinspectionDue,
                Label : 'Reinspection Due',
            },
            {
                $Type : 'UI.DataField',
                Value : removalCosts,
                Label : 'Removal Costs',
            },
            {
                $Type : 'UI.DataField',
                Value : sampleNo,
                Label : 'Sample No',
            },
            {
                $Type : 'UI.DataField',
                Value : waterDamage,
                Label : 'Water Damage',
            },
            {
                $Type : 'UI.DataField',
                Value : comments,
                Label : 'Comments',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Survey Details',
            Target : '@UI.FieldGroup#AsbestosSurveyGroup',
        },
    ],
    UI.Table : {
        $Type : 'UI.TableType',
        SelectionMode : 'Multi',
        EnableExport : true,
        EnableFullScreen : true,
    },
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : surveyNumber,
        },
        TypeName : 'Asbestos Survey',
        TypeNamePlural : 'Asbestos Surveys',
        Description : {
            $Type : 'UI.DataField',
            Value : buildingDescription,
        },
    },
);

