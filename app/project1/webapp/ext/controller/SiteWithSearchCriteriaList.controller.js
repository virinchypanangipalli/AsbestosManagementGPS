sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/core/UIComponent",
    "sap/m/MessageToast",
    "sap/m/Button"
], function (Controller, UIComponent, MessageToast, Button) {
    "use strict";

    return Controller.extend("project1.ext.controller.SiteWithSearchCriteriaList", {
        
        onInit: function() {
            console.log("Controller initialized");
        },
        
        onAfterRendering: function() {
            this.addShowMapButton();
        },
        
        addShowMapButton: function() {
            // Add Show Map button to the header
            var oView = this.getView();
            console.log("View:", oView);
            
            // Try different possible toolbar IDs
            var oHeader = oView.byId("template::ListReport::TableToolbar") || 
                        oView.byId("template::ListReport::Toolbar") ||
                        oView.byId("template::ObjectPage::Header") ||
                        oView.byId("template::ObjectPage::Toolbar");
            
            console.log("Found header:", oHeader);
            
            if (oHeader && !this._showMapButtonAdded) {
                var that = this;
                var oShowMapButton = new Button({
                    text: "Show Map",
                    icon: "sap-icon://map",
                    press: function(oEvent) {
                        console.log("Button pressed!");
                        that.onShowMap(oEvent);
                    },
                    type: "Emphasized"
                });
                
                oHeader.addContent(oShowMapButton);
                this._showMapButtonAdded = true;
                console.log("Show Map button added successfully to:", oHeader.getId());
            } else {
                console.log("Header not found or button already added. Header:", oHeader);
                // Try to find any toolbar in the view
                this.findAndAddButtonToToolbar(oView);
            }
        },
        
        findAndAddButtonToToolbar: function(oView) {
            console.log("Searching for toolbar in view hierarchy...");
            var that = this;
            
            // Try to find any toolbar by traversing the view
            var findToolbar = function(oControl) {
                if (oControl && oControl.getMetadata && oControl.getMetadata().getName() === "sap.m.Toolbar") {
                    console.log("Found toolbar:", oControl.getId());
                    if (!that._showMapButtonAdded) {
                        var oShowMapButton = new Button({
                            text: "Show Map",
                            icon: "sap-icon://map",
                            press: function(oEvent) {
                                console.log("Button pressed!");
                                that.onShowMap(oEvent);
                            },
                            type: "Emphasized"
                        });
                        
                        oControl.addContent(oShowMapButton);
                        that._showMapButtonAdded = true;
                        console.log("Show Map button added to toolbar:", oControl.getId());
                    }
                    return true;
                }
                
                if (oControl && oControl.getContent) {
                    var aContent = oControl.getContent();
                    for (var i = 0; i < aContent.length; i++) {
                        if (findToolbar(aContent[i])) {
                            return true;
                        }
                    }
                }
                
                return false;
            };
            
            findToolbar(oView);
        },
        
        onShowMap: function (oEvent) {
            console.log("onShowMap called");
            try {
                MessageToast.show("Show Map button pressed!");
                console.log("MessageToast shown");
                
                var oRouter = UIComponent.getRouterFor(this);
                console.log("Router:", oRouter);
                
                if (oRouter) {
                    console.log("Navigating to MapsView");
                    oRouter.navTo("MapsView");
                } else {
                    MessageToast.show("Router not found!");
                    console.error("Router not found");
                }
            } catch (error) {
                MessageToast.show("Error: " + error.message);
                console.error("Error in onShowMap:", error);
            }
        }
        
    });
});
