module apps.bim;

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
  import apps.bim.controllers;
  import apps.bim.helpers;
  import apps.bim.routers;
  import apps.bim.tests;
  import apps.bim.views;
}

@safe:
static this() {
  auto myApp = App("bimApp", "apps/bim");
  with(myApp) {
    importTranslations();
    addControllers([
      "bim.index": IndexPageController
    ]);
    addRoutes(
      Route("", HTTPMethod.GET, controller("bim.index")),
      Route("/", HTTPMethod.GET, controller("bim.index"))
    );
  }

  AppRegistry.register("apps.bim", myApp);
}
