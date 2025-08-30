sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/core/UIComponent",
    "sap/m/MessageToast"
], function (Controller, UIComponent, MessageToast) {
    "use strict";

    return Controller.extend("project1.ext.controller.SiteWithSearchCriteriaListExt", {
        
        onShowMap: function (oEvent) {
            try {
                MessageToast.show("Show Map button pressed!");
                var oRouter = UIComponent.getRouterFor(this);
                if (oRouter) {
                    oRouter.navTo("MapsView");
                } else {
                    MessageToast.show("Router not found!");
                }
            } catch (error) {
                MessageToast.show("Error: " + error.message);
                console.error("Error in onShowMap:", error);
            }
        }
        
    });
});