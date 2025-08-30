sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/core/UIComponent",
    "sap/ui/model/json/JSONModel",
    "sap/m/MessageToast",
    "sap/m/Dialog",
    "sap/m/Button",
    "sap/m/Text",
    "sap/ui/layout/VerticalLayout"
], function (Controller, UIComponent, JSONModel, MessageToast, Dialog, Button, Text, VerticalLayout) {
    "use strict";

    return Controller.extend("project1.ext.controller.MapsController", {
        onInit: function () {
            this._loadMapLibraries();
        },

        _loadMapLibraries: function () {
            // Load OpenLayers CSS
            if (!document.getElementById('ol-css')) {
                var link = document.createElement('link');
                link.id = 'ol-css';
                link.rel = 'stylesheet';
                link.href = 'https://cdn.jsdelivr.net/npm/ol@v7.4.0/ol.css';
                document.head.appendChild(link);
            }

            // Load OpenLayers JS
            if (typeof ol === 'undefined') {
                var script = document.createElement('script');
                script.src = 'https://cdn.jsdelivr.net/npm/ol@v7.4.0/dist/ol.js';
                script.onload = () => {
                    this._initializeMap();
                };
                document.head.appendChild(script);
            } else {
                this._initializeMap();
            }
        },

        _initializeMap: function () {
            var oView = this.getView();
            var oMapContainer = oView.byId("mapContainer");
            
            if (!oMapContainer || !window.ol) {
                return;
            }

            // Create map
            var map = new ol.Map({
                target: oMapContainer.getDomRef(),
                layers: [
                    new ol.layer.Tile({
                        source: new ol.source.OSM()
                    })
                ],
                view: new ol.View({
                    center: ol.proj.fromLonLat([144.9631, -37.8136]), // Melbourne
                    zoom: 8
                })
            });

            this._map = map;
            this._loadMapData();
        },

        _loadMapData: function () {
            var that = this;
            var oModel = this.getOwnerComponent().getModel();

            // Load SiteWithSearchCriteria data
            oModel.read("/SiteWithSearchCriteria", {
                urlParameters: {
                    "$select": "ID,siteDescription,functionalLocationLatitude,functionalLocationLongitude,functionalLocationNo",
                    "$filter": "functionalLocationLatitude ne null and functionalLocationLongitude ne null"
                },
                success: function (oData) {
                    that._addSiteMarkers(oData.results);
                },
                error: function (oError) {
                    console.error("Error loading site data:", oError);
                }
            });

            // Load AsbestosSurvey data
            oModel.read("/AsbestosSurvey", {
                urlParameters: {
                    "$select": "ID,buildingDescription,surveyLatitude,surveyLongitude,surveyedBy,riskRating",
                    "$filter": "surveyLatitude ne null and surveyLongitude ne null"
                },
                success: function (oData) {
                    that._addSurveyMarkers(oData.results);
                },
                error: function (oError) {
                    console.error("Error loading survey data:", oError);
                }
            });
        },

        _addSiteMarkers: function (aData) {
            if (!this._map) return;

            var features = [];
            aData.forEach(function (item) {
                if (item.functionalLocationLatitude && item.functionalLocationLongitude) {
                    var feature = new ol.Feature({
                        geometry: new ol.geom.Point(
                            ol.proj.fromLonLat([parseFloat(item.functionalLocationLongitude), parseFloat(item.functionalLocationLatitude)])
                        ),
                        name: item.siteDescription || 'Site',
                        type: 'site',
                        data: item
                    });
                    features.push(feature);
                }
            });

            var vectorLayer = new ol.layer.Vector({
                source: new ol.source.Vector({
                    features: features
                }),
                style: new ol.style.Style({
                    image: new ol.style.Circle({
                        radius: 8,
                        fill: new ol.style.Fill({
                            color: '#0066cc'
                        }),
                        stroke: new ol.style.Stroke({
                            color: '#ffffff',
                            width: 2
                        })
                    })
                })
            });

            this._map.addLayer(vectorLayer);
        },

        _addSurveyMarkers: function (aData) {
            if (!this._map) return;

            var that = this;
            var features = [];
            aData.forEach(function (item) {
                if (item.surveyLatitude && item.surveyLongitude) {
                    var feature = new ol.Feature({
                        geometry: new ol.geom.Point(
                            ol.proj.fromLonLat([parseFloat(item.surveyLongitude), parseFloat(item.surveyLatitude)])
                        ),
                        name: item.buildingDescription || 'Survey',
                        type: 'survey',
                        data: item
                    });
                    features.push(feature);
                }
            });

            var vectorLayer = new ol.layer.Vector({
                source: new ol.source.Vector({
                    features: features
                }),
                style: new ol.style.Style({
                    image: new ol.style.Circle({
                        radius: 6,
                        fill: new ol.style.Fill({
                            color: '#ff6600'
                        }),
                        stroke: new ol.style.Stroke({
                            color: '#ffffff',
                            width: 2
                        })
                    })
                })
            });

            this._map.addLayer(vectorLayer);

            // Add click handler
            this._map.on('click', function (evt) {
                var feature = this.forEachFeatureAtPixel(evt.pixel, function (feature) {
                    return feature;
                });

                if (feature) {
                    that._showPopup(feature, evt.coordinate);
                }
            });
        },

        _showPopup: function (feature, coordinate) {
            var data = feature.get('data');
            var type = feature.get('type');
            var name = feature.get('name');

            var content = new VerticalLayout({
                content: [
                    new Text({
                        text: "Name: " + name
                    }),
                    new Text({
                        text: "Type: " + (type === 'site' ? 'Functional Location' : 'Asbestos Survey')
                    })
                ]
            });

            if (type === 'site') {
                content.addContent(new Text({
                    text: "Location No: " + (data.functionalLocationNo || 'N/A')
                }));
            } else {
                content.addContent(new Text({
                    text: "Surveyed By: " + (data.surveyedBy || 'N/A')
                }));
                content.addContent(new Text({
                    text: "Risk Rating: " + (data.riskRating || 'N/A')
                }));
            }

            var dialog = new Dialog({
                title: "Location Details",
                content: content,
                beginButton: new Button({
                    text: "Close",
                    press: function () {
                        dialog.close();
                    }
                }),
                afterClose: function () {
                    dialog.destroy();
                }
            });

            dialog.open();
        },

        onShowMap: function () {
            var oRouter = UIComponent.getRouterFor(this);
            oRouter.navTo("MapsView");
        },

        onNavBack: function () {
            var oRouter = UIComponent.getRouterFor(this);
            oRouter.navTo("SiteWithSearchCriteriaList");
        },

        onPageNavButtonPress: function () {
            var oRouter = UIComponent.getRouterFor(this);
            oRouter.navTo("SiteWithSearchCriteriaList");
        },

        onAfterRendering: function () {
            if (this._map) {
                this._map.updateSize();
            }
        }
    });
});