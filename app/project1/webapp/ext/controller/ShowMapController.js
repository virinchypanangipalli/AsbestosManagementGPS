sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/core/UIComponent"
], function (Controller, UIComponent) {
    "use strict";

    return Controller.extend("project1.ext.controller.ShowMapController", {
        
        onShowMap: function (oEvent) {
            var oRouter = UIComponent.getRouterFor(this);
            oRouter.navTo("MapsView");
        }
        
    });
});