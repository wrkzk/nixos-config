{ pkgs, config, ... }:

{
  services.fnott = {
    enable = true;
    settings = {
      main = {
        min-width = 0;
        max-width = 400;
        max-height = 200;
        stacking-order = "bottom-up";
        achor = "top-right";
        edge-margin-vertical = 10;
        edge-margin-horizontal = 10;
        notification-margin = 10;
        max-icon-size = 32;
        selection-helper = "bemenu";
        layer = "top";
        background = "3f5f3fff";
      };
      low = {
      };
      normal = {
      };
      critical = {
      };
    }
  };
}
