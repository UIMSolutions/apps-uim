/*********************************************************************************************************
  Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
  License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
  Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module apps.contacts;

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
  import apps.contacts.controllers;
  import apps.contacts.helpers;
  import apps.contacts.routers;
  import apps.contacts.tests;
  import apps.contacts.views;
}

@safe:
static this() {
  auto myApp = App("contactsApp", "apps/contacts");
  
  with(myApp) {
    importTranslations;
    addControllers([
      "contact.index": IndexPageController
    ]);
    addRoutes(
      Route("", HTTPMethod.GET, controller("contact.index")),
      Route("/", HTTPMethod.GET, controller("contact.index"))
    );
  }

  AppRegistry.register("apps.contacts", myApp);
}