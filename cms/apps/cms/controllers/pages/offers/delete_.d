module apps.cms.controllers.pages.offers.delete_;

import apps.cms;
@safe:

class DCMSOffersDeletePageController : DCMSDeletePageController {
  mixin(ControllerThis!("CMSOffersDeletePageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this.scripts.addContents(
      editorSummary~
      editorText~
      "editorSummary.disabled();"~
      "editorText.disabled();"
    );

    this
      .rootPath("/cms/offers") 
      .collectionName("cms_offers"); 
  }
}
mixin(ControllerCalls!("CMSOffersDeletePageController"));