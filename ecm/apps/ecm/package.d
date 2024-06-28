module apps.ecm;

mixin(ImportPhobos!());

// External
public {
  import vibe.d;
}

// UIM
public import uim.core;
public import uim.bootstrap;
public import uim.html;
public import uim.oop;
public import uim.models;
public import uim.apps;
public import web.controls;
public import uim.servers;

public import langs.javascript;

public {
  import apps.ecm.controllers;
  import apps.ecm.helpers;
  import apps.ecm.routers;
  import apps.ecm.tests;
  import apps.ecm.views;
}

static this() {
  auto myApp = App("ecmApp", "apps/ecm");

  with(myApp) {
    importTranslations;
    addControllers([
      "ecm.index": IndexPageController
    ]);
    addRoutes(
      Route("", HTTPMethod.GET, controller("ecm.index")),
      Route("/", HTTPMethod.GET, controller("ecm.index"))
    );
  }
  
  AppRegistry.register("apps.ecm", myApp);
}