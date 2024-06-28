module apps.cms.forms.contents.theme;

import apps.cms;
@safe:

class DCMSThemeFormContent : DEntityFormContent {
  mixin(ViewComponentThis!("CMSThemeFormContent"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .crudMode(CRUDModes.Create)
    .fields([/* "active",  */"name", "display", "description", "maintitle", "subtitle", /* "keywords", */ "image", "summary", /* "themes", */ "text"]); 
  }

/*   override DH5Obj[] formGroup(string field, bool readonly, STRINGAA options = null) {
    if (form) {
      this.crudMode(form.crudMode);
    
      if (auto formWithEntity = cast(IAPPWithEntity)form) { 
        DCMSTheme entity = cast(DCMSTheme)formWithEntity.entity;
        if (entity) switch(field) {
          case "maintitle": return CMSFormGroupMainTitle(form).entity(entity).toH5(options);
          case "subtitle":  return CMSFormGroupSubTitle(form).entity(entity).toH5(options);
          case "image":     return CMSFormGroupImage(form).entity(entity).toH5(options);
          case "summary":   return CMSFormGroupSummary(form).entity(entity).toH5(options);
          case "themes":    return CMSFormGroupTheme(form).entity(entity).toH5(options);
          case "text":      return CMSFormGroupText(form).entity(entity).toH5(options);
          default: return super.formGroup(field, readonly, options); 
        }
      }
    }
    return null;
  } */
}
mixin(ViewComponentCalls!("CMSThemeFormContent"));

version(test_uim_cms) { unittest {
    assert(CMSThemeFormContent(myForm));
}}
