module apps.cms;

mixin(ImportPhobos!());

// External
public {
  import vibe.d;
}

// UIM
public {
  import uim.core;
  import uim.bootstrap;
  import uim.html;
  import uim.oop;
  import uim.models;
  import uim.apps;
  import uim.servers;
  /* import uim.web; */
}

public {
  import web.controls;
}

public {
  import langs.javascript;
}

public { // App packages
  import apps.cms.controllers;
  import apps.cms.forms;
  import apps.cms.helpers;
  import apps.cms.javascripts;
  import apps.cms.layouts;
  import apps.cms.routes;
  import apps.cms.scripts;
  import apps.cms.settings;
  import apps.cms.tests;
  import apps.cms.views;
}

@safe:
static this() { // Create and init app
  auto myApp = new class DApp {
    override void initialize(Json configSettings = Json(null)) {
      super.initialize(configSettings);

      this
        .name("cmsApp");  

      debug writeln("In %s: Create view & controllers".format(name));
      foreach(entityName; ["blogs", "glossary", "links", "news", "offer", "themes"]) {      
        foreach(crudName; ["list", "create", "read", "update", "delete"]) {  

          debug writeln("In %s: Create view %s".format(name, crudName~entityName));
          auto myView = CMSView;
          myView
            .pageHeader(
              PageHeaderViewComponent
                .rootPath(rootPath)
                .title("CMS -> "~entityName ~"->"~crudName)
            )
            .pageBody(PageBodyViewComponent)
            .pageFooter(MVCPageFooterViewComponent)      
            .rootPath("/cms");
          
          this.addView(crudName~entityName, myView);
          auto controllerName = (crudName == "list" ? "cms."~entityName : "cms."~entityName~"."~crudName);

          debug writeln("In %s: Create controller %s".format(name, controllerName));
          auto myController = PageController.view(myView);
          this.addController(controllerName, myController);

          auto myPath = (crudName == "list" ? "/"~entityName : "/"~entityName~"/"~crudName);
          this.addRoute(Route(myPath, HTTPMethod.GET, controller(controllerName)));
          if (crudName == "create" || crudName == "update" || crudName == "delete") {
            auto myAction = CMSActionController;
            this.actions.add(crudName~entityName, myAction);
            this.addRoute(Route(myPath~"_action", HTTPMethod.POST, controller(controllerName)));
          }
        }
      }

      writeln("In App %s registered views:".format(name));
      writeln(viewNames);

      writeln("In App %s registered controllers:".format(name));
      writeln(controllerNames);
    }
  };

  with(myApp) {
    name("appCMS");
    rootPath("apps/cms");
    importTranslations();
    addControllers(
      ["cms.index": CMSIndexPageController]
    );
    addRoutes(
      Route("", HTTPMethod.GET, controller("cms.index")),
      Route("/", HTTPMethod.GET, controller("cms.index"))
    );
  }

  AppRegistry.register("apps.cms", myApp);
  
  debug writeln("In App %s Registered App:".format(myApp.name));
  AppRegistry.register("apps.cms",  myApp);
}

