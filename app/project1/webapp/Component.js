sap.ui.define(
    ["sap/fe/core/AppComponent"],
    function (Component) {
        "use strict";

        return Component.extend("project1.Component", {
            metadata: {
                manifest: "json"
            },
            
            onShowMap: function (oEvent) {
                var oRouter = this.getRouter();
                oRouter.navTo("MapsView");
            }
        });
    }
);