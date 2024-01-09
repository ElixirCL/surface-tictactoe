defmodule SurfaceExampleWeb.Components.CardTest do
  use SurfaceExampleWeb.ConnCase, async: true
  use Surface.LiveViewTest

  catalogue_test SurfaceExampleWeb.Card
end
