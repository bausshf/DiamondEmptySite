/**
* Module for the home controller.
*/
module controllers.homecontroller;

import vibe.d;

import diamond.controllers;

import models.home;

/// The controller for the home view.
final class HomeController(TView) : Controller!TView {
  public:
  final:
  /**
  * Creates a new instance of the home controller.
  * Params:
  *   view =  The view assocaited with the controller.
  */
  this(TView view) {
    super(view);

    mapDefault(&home);
  }

  private:
  /// Route: / | /home
  Status home() {
    view.model = new Home("Home");

    return Status.success;
  }
}
