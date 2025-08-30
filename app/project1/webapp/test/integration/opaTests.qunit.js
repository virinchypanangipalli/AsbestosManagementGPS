sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'project1/test/integration/FirstJourney',
		'project1/test/integration/pages/SiteWithSearchCriteriaList',
		'project1/test/integration/pages/SiteWithSearchCriteriaObjectPage'
    ],
    function(JourneyRunner, opaJourney, SiteWithSearchCriteriaList, SiteWithSearchCriteriaObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('project1') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheSiteWithSearchCriteriaList: SiteWithSearchCriteriaList,
					onTheSiteWithSearchCriteriaObjectPage: SiteWithSearchCriteriaObjectPage
                }
            },
            opaJourney.run
        );
    }
);