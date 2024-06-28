module apps.cms.forms.inputs.handler;

import apps.cms;
@safe:

class DCMSFormInputHandler : DFormInputHandler {
  mixin(ViewComponentThis!("CMSFormInputHandler"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .addFormInputs([
        "private": CMSPrivateFormInput, 
        "maintitle": CMSMainTitleFormInput, 
        "subtitle": CMSSubTitleFormInput, 
        "keywords": CMSKeywordsFormInput, 
        "image": CMSImageFormInput, 
        "summary": CMSSummaryFormInput, 
        "text": CMSTextFormInput, 
        "themes": CMSThemesFormInput]);
  } 
}  
mixin(ViewComponentCalls!("CMSFormInputHandler"));
