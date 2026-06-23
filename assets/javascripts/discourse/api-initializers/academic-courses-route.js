import { withPluginApi } from "discourse/lib/plugin-api";

export default {
  name: "academic-courses-profile-tab",
  initialize() {
    withPluginApi("1.2.0", (api) => {
      api.addProfileRoute("academic-courses", "/courses", "academic_courses.tab_title");
      // Note: If targeting Discourse > 3.2, map to api.addUserRoute instead depending on exact placement
    });
  }
};