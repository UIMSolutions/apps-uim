module apps.cms.forms.contents.post;

import apps.cms;
@safe:

class DCMSPostFormContent : DEntityFormContent {
  mixin(ViewComponentThis!("CMSPostFormContent"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .crudMode(CRUDModes.Read)
    .addFields(["private", "maintitle", "subtitle", "keywords", "image", "summary", "themes", "text"])
    .inputHandler(CMSFormInputHandler);   }

/*   override DH5Obj[] formGroup(string field, bool readonly, STRINGAA options = null) {
    if (entity) {
      switch(field) {
        case "private": return CMSFormGroupPrivate(form).entity(entity).toH5(options);
        case "maintitle": return CMSFormGroupMainTitle(form).entity(entity).toH5(options);
        case "subtitle": return CMSFormGroupSubTitle(form).entity(entity).toH5(options);
        case "keywords": return CMSFormGroupKeywords(form).entity(entity).toH5(options);
        case "image": return CMSFormGroupImage(form).entity(entity).toH5(options);
        case "summary": return CMSFormGroupSummary(form).entity(entity).toH5(options);
        case "text": return CMSFormGroupText(form).entity(entity).toH5(options);
        case "themes": return CMSFormGroupTheme(form).entity(entity).toH5(options);
        default: return super.formGroup(field, readonly, options); // get previous defined formgroups
    }}
    return null;
  } */
}
mixin(ViewComponentCalls!("CMSPostFormContent"));
