module apps.cms.views.blogs;

// Blogs 
public {
  import apps.cms.views.blogs.index;

  import apps.cms.views.blogs.create;
  import apps.cms.views.blogs.read;
  import apps.cms.views.blogs.edit;
  import apps.cms.views.blogs.delete_;
}

package:
  string myRootPath = "/cms/blogs";
  // Tuple!(string, "de", string, "en") entityNames = tuple!("Blog", "Blog");
  // alias entitiesNames = tuple!("de", "en")("Blogs", "Blogs");
