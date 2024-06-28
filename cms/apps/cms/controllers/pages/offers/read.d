module apps.cms.controllers.pages.offers.read;

import apps.cms;
@safe:

class DCMSOffersReadPageController : DCMSReadPageController {
  mixin(ControllerThis!("CMSOffersReadPageController"));

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
      .collectionName("cms_offers");   }
}
mixin(ControllerCalls!("CMSOffersReadPageController"));