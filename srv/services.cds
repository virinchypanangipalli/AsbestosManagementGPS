
using { asbestos.management as my } from '../db/schema';

service AsbestosService {
    entity SiteWithSearchCriteria as projection on my.SiteWithSearchCriteria;
annotate SiteWithSearchCriteria with @odata.draft.enabled;

    entity Site as projection on my.Site;
    annotate Site with @odata.draft.enabled;

    entity AsbestosSurvey as projection on my.AsbestosSurvey;
  
    
    entity SearchCriteria as projection on my.SearchCriteria;
annotate SearchCriteria with @odata.draft.enabled;

    entity FunctionalLocation as projection on my.FunctionalLocation;
    entity Equipment as projection on my.Equipment;
}

