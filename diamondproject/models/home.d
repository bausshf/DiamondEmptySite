/**
* Module for the home model.
*/
module models.home;

/// The model for the home view.
class Home {
  private:
  /// The title.
  string _title;

  public:
  /**
  * Creates a new instance of the home model.
  * Params:
  *   title = The title of the home view.
  */
  this(string title) {
    _title = title;
  }

  @property {
    /// Gets the title.
    auto title() { return _title; }
  }
}
